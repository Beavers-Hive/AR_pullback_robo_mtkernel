//
//  Ble.swift
//  FocusPencile
//
//  Created by saitetu on 2023/12/24.
//

import CoreBluetooth

class BluetoothManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    private var centralManager: CBCentralManager!
    @Published var receivedValue: String = ""
    @Published var isConnect: Bool = false
    var descript: String = "init"
    var lastExecutionTime: Date?
    var lastSendMes = ""

    
    var kUARTServiceUUID = "" // サービス
    var kRXCharacteristicUUID = "" // ペリフェラルからの受信用

    var peripheral: CBPeripheral!
    var serviceUUID : CBUUID!
    var kRXCBCharacteristic: CBCharacteristic?
    var charcteristicUUIDs: [CBUUID]!
    
    var focuspoint: Double = 0.0
    
    init(kUARTServiceUUID:String,kRXCharacteristicUUID:String) {
        super.init()
        self.kRXCharacteristicUUID = kRXCharacteristicUUID
        self.kUARTServiceUUID = kUARTServiceUUID
        centralManager = CBCentralManager()
        centralManager.delegate = self as CBCentralManagerDelegate
        serviceUUID = CBUUID(string: kUARTServiceUUID)
        charcteristicUUIDs = [CBUUID(string: kRXCharacteristicUUID)]
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            // BLE通信を開始できる状態
//            startScanning()
        } else {
            // BLE通信が利用できない状態
            return
        }
    }
    
    func startScanning(){
        let services: [CBUUID] = [serviceUUID]
        centralManager.scanForPeripherals(withServices: services,
                                          options: nil)
        print("scan")
        descript = "scan"
    }
    
    func send(mes:String){
        let currentTime = Date()
        // もしlastExecutionTimeが設定されていて、100ms以内であればreturn
        if let lastTime = lastExecutionTime, currentTime.timeIntervalSince(lastTime) < 0.1 {
            return
        }
        lastExecutionTime = currentTime
        lastSendMes = mes

        let writeData = mes.data(using: .utf8)!
//        print(mes)
        self.peripheral?.writeValue(writeData, for: kRXCBCharacteristic!, type: .withResponse)
    }
    
    func disconnect(){
        print("disconnect")
        if(self.peripheral != nil){
            centralManager.cancelPeripheralConnection(self.peripheral)
        }
    }
    
    func centralManager(_ central: CBCentralManager,
                        didDiscover peripheral: CBPeripheral,
                        advertisementData: [String : Any],
                        rssi RSSI: NSNumber) {
        print("search")
        self.peripheral = peripheral
        centralManager?.stopScan()
        
        //接続開始
        central.connect(peripheral, options: nil)
        print("  - centralManager didDiscover")
    }
    /// 接続されると呼ばれる
    func centralManager(_ central: CBCentralManager,
                        didConnect peripheral: CBPeripheral) {
        
        peripheral.delegate = self
        peripheral.discoverServices([serviceUUID])
        print("  - centralManager didConnect")
    }
    
    /// 切断されると呼ばれる？
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print(#function)
        if error != nil {
            print(error.debugDescription)
            return
        }
    }
}
//MARK : - CBPeripheralDelegate
extension BluetoothManager: CBPeripheralDelegate {
    
    /// サービス発見時に呼ばれる
    func peripheral(_ peripheral: CBPeripheral,
                    didDiscoverServices error: Error?) {
        
        if error != nil {
            print(error.debugDescription)
            return
        }
        
        //キャリアクタリスティク探索開始
        if let service = peripheral.services?.first {
            print("Searching characteristic...")
            peripheral.discoverCharacteristics(charcteristicUUIDs,
                                               for: service)
        }
    }
    
    /// キャリアクタリスティク発見時に呼ばれる
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        
        if error != nil {
            print(error.debugDescription)
            return
        }
        
        print("service.characteristics.count: \(service.characteristics!.count)")
        for characteristics in service.characteristics! {
            if(characteristics.uuid == CBUUID(string: kRXCharacteristicUUID)) {
                self.kRXCBCharacteristic = characteristics
                print("kTXCBCharacteristic did discovered!")
            }
        }
        
        if(self.kRXCBCharacteristic != nil) {
            startReciving()
        }
        print("  - Characteristic didDiscovered")
        isConnect = true
        
    }
    
    private func startReciving() {
        guard kRXCBCharacteristic != nil else {
            return
        }
        print("Start monitoring the message from Arduino.\n\n")
        descript = "connected"
    }
    
    
    /// データ送信時に呼ばれる
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        print(#function)
        if error != nil {
            print(error.debugDescription)
            return
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        print(#function)
        
    }
    
    /// データ更新時に呼ばれる
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        //        print(#function)
        
        if error != nil {
            print(error.debugDescription)
            return
        }
        updateWithData(data: characteristic.value!)
    }
    
    private func updateWithData(data : Data) {
        if let dataString = String(data: data, encoding: String.Encoding.utf8) {
            print(dataString)
            self.receivedValue = dataString
        }
    }
    
    
}
