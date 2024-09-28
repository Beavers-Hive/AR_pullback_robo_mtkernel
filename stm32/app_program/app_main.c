/*
 *	app_main.c
 *	Application main program for STM32H723 Nucleo-144
 */

#include <tk/tkernel.h>
#include <tm/tmonitor.h>
#include <tk/device.h>

#define MPU9250_ADDRESS 0x68
#define ACCEL_XOUT_H 0x3B
#define GYRO_XOUT_H  0x43

// UART設定
#define UART_DEVNAME "UART1"
#define UART_BAUDRATE 115200
#define BUFFER_SIZE 64

// タスク設定
#define MOTOR_TASK_PRIORITY 12
#define MOTOR_TASK_STACK_SIZE 1024

typedef struct {
    float q;
    float r;
    float x;
    float p;
    float k;
} KalmanFilter;

void kalman_init(KalmanFilter* kf, float init_x, float init_p, float q, float r) {
    kf->x = init_x;
    kf->p = init_p;
    kf->q = q;
    kf->r = r;
}

float kalman_update(KalmanFilter* kf, float measurement) {
    kf->p += kf->q;
    kf->k = kf->p / (kf->p + kf->r);
    kf->x += kf->k * (measurement - kf->x);
    kf->p *= (1 - kf->k);

    return kf->x;
}

LOCAL INT accel[3], gyro[3];
LOCAL float odom_x = 0.0f, odom_y = 0.0f, odom_theta = 0.0f;
LOCAL KalmanFilter kf_accel_x, kf_accel_y, kf_accel_z;
LOCAL KalmanFilter kf_gyro_z, kf_motor_angle;

LOCAL void i2c_read_register(UINT reg, UINT* data, UINT length);
LOCAL void read_mpu9250(INT* accel, INT* gyro);
LOCAL void uart_init(void);
LOCAL char* uart_read_angle(INT* angle);
LOCAL void task_1(INT stacd, void *exinf);
LOCAL void task_2(INT stacd, void *exinf);
LOCAL void task_motor_odometry(INT stacd, void *exinf);

LOCAL ID tskid_1, tskid_2, tskid_motor;

LOCAL T_CTSK ctsk_1 = {
    .itskpri    = 10,
    .stksz      = 1024,
    .task       = task_1,
    .tskatr     = TA_HLNG | TA_RNG3,
};

LOCAL T_CTSK ctsk_2 = {
    .itskpri    = 10,
    .stksz      = 1024,
    .task       = task_2,
    .tskatr     = TA_HLNG | TA_RNG3,
};

LOCAL T_CTSK ctsk_motor = {
    .itskpri    = MOTOR_TASK_PRIORITY,
    .stksz      = MOTOR_TASK_STACK_SIZE,
    .task       = task_motor_odometry,
    .tskatr     = TA_HLNG | TA_RNG3,
};

LOCAL void i2c_read_register(UINT reg, UINT* data, UINT length) {
    ID dd;
    SZ asize;

    dd = tk_opn_dev((UB*)"Uucp", TD_UPDATE);

    if (dd >= 0) {
        ER result = tk_srea_dev(dd, reg, data, length, &asize);

        if (result >= 0) {
            tm_printf((const UB*)"Data successfully read from register 0x%x. Bytes read: %d\n", reg, asize);
            for (UINT i = 0; i < asize; i++) {
                tm_printf((const UB*)"Data[%d] = 0x%x\n", i, data[i]);
            }
        } else {
            tm_printf((const UB*)"Error reading from register 0x%x\n", reg);
        }

        tk_cls_dev(dd, 0);
    } else {
        tm_printf((const UB*)"Failed to open I2C device\n");
    }
}

LOCAL void read_mpu9250(INT* accel, INT* gyro) {
    UINT data[14];
    memset(data, 0, sizeof(data));
    i2c_read_register(ACCEL_XOUT_H, data, 14);

    accel[0] = (data[0] << 8) | data[1];  // X軸
    accel[1] = (data[2] << 8) | data[3];  // Y軸
    accel[2] = (data[4] << 8) | data[5];  // Z軸
    gyro[0] = (data[8] << 8) | data[9];    // X軸
    gyro[1] = (data[10] << 8) | data[11];  // Y軸
    gyro[2] = (data[12] << 8) | data[13];  // Z軸
}

LOCAL void uart_init(void) {
    ID uart_id = tk_opn_dev((UB*)UART_DEVNAME, -1);
    if (uart_id < 0) {
        tm_printf((const UB*)"Failed to open UART device\n");
        return;
    }
    tk_cls_dev(uart_id, 0);
}

LOCAL char* uart_read_angle(INT* angle) {

    static char buffer[BUFFER_SIZE];  // staticにして関数外でも使用できるようにする
    int index = 0;
    int ch;

    // 1文字ずつ受信し、バッファに追加
    while (index < BUFFER_SIZE - 1) {
        ch = tm_getchar(1);  // 1文字受信
        if (ch < 0) {
            tm_printf((const UB*)"Failed to read from UART\n");
            return NULL;
        }

        buffer[index++] = (char)ch;

        // 改行文字を受信したら終了
        if (ch == '\n') {
            break;
        }
    }
    buffer[index] = '\0';  // 文字列終端を追加

    return buffer;  // バッファを返す
}



LOCAL void task_1(INT stacd, void *exinf)
{
    while(1) {
        tm_printf((const UB*)"Accel: X=%d, Y=%d, Z=%d\n", accel[0], accel[1], accel[2]);
        tm_printf((const UB*)"Gyro:  X=%d, Y=%d, Z=%d\n", gyro[0], gyro[1], gyro[2]);

        tk_dly_tsk(100);
    }
}

LOCAL void task_2(INT stacd, void *exinf)
{
    while(1) {
        read_mpu9250(accel, gyro);
        tk_dly_tsk(10);
    }
}

LOCAL void task_motor_odometry(INT stacd, void *exinf)
{
    INT motor_angle = 0;
    while (1) {
        if (uart_read_angle(&motor_angle) == 0) {

            float filtered_accel_x = kalman_update(&kf_accel_x, (float)accel[0]);
            float filtered_accel_y = kalman_update(&kf_accel_y, (float)accel[1]);
            float filtered_gyro_z = kalman_update(&kf_gyro_z, (float)gyro[2]);
            float dt = 0.01f;

            // 姿勢の更新
            odom_theta += filtered_gyro_z * dt;
            float delta_x = filtered_accel_x * dt * dt;
            float delta_y = filtered_accel_y * dt * dt;

            odom_x += delta_x;
            odom_y += delta_y;

            tm_printf((const UB*)"Odom: X=%.2f, Y=%.2f, Theta=%.2f\n", odom_x, odom_y, odom_theta);
        }

        tk_dly_tsk(10);  // 10ms周期
    }
}

// メインタスク
EXPORT INT usermain(void)
{
    tm_printf((const UB*)"User program started\n");

    // UARTの初期化
    uart_init();

    // カルマンフィルターの初期化
    kalman_init(&kf_accel_x, 0.0f, 1.0f, 0.001f, 0.1f);
    kalman_init(&kf_accel_y, 0.0f, 1.0f, 0.001f, 0.1f);
    kalman_init(&kf_accel_z, 0.0f, 1.0f, 0.001f, 0.1f);
    kalman_init(&kf_gyro_z, 0.0f, 1.0f, 0.001f, 0.1f);
    kalman_init(&kf_motor_angle, 0.0f, 1.0f, 0.001f, 0.1f);

    tskid_1 = tk_cre_tsk(&ctsk_1);
    if (tskid_1 >= 0) {
        tk_sta_tsk(tskid_1, 0);
    } else {
        tm_printf((const UB*)"Failed to create task_1\n");
    }
    tskid_2 = tk_cre_tsk(&ctsk_2);
    if (tskid_2 >= 0) {
        tk_sta_tsk(tskid_2, 0);
    } else {
        tm_printf((const UB*)"Failed to create task_2\n");
    }
    tskid_motor = tk_cre_tsk(&ctsk_motor);
    if (tskid_motor >= 0) {
        tk_sta_tsk(tskid_motor, 0);
    } else {
        tm_printf((const UB*)"Failed to create motor task\n");
    }

    tk_slp_tsk(TMO_FEVR);
    return 0;
}
