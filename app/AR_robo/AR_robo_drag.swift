import SwiftUI
import ARKit
import SceneKit

struct ARDragViewContainer: UIViewRepresentable {
    
    @ObservedObject private var bluetoothManager = BluetoothManager(kUARTServiceUUID: "7fafc201-1fb5-459e-8fcc-c1c9c331914b", kRXCharacteristicUUID: "beb2483e-36e1-4688-b7f5-ea07363b26a8")

    func makeUIView(context: Context) -> ARSCNView {
        var arView = ARSCNView()
        let configuration = ARWorldTrackingConfiguration()

        if let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) {
            configuration.detectionImages = referenceImages
            configuration.maximumNumberOfTrackedImages = 1
        }
        configuration.planeDetection = .horizontal

        arView.session.run(configuration)
        arView.delegate = context.coordinator

        // パンジェスチャー（引っ張る操作）の追加
        let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan(_:)))
        arView.addGestureRecognizer(panGesture)
        
        // Bluetoothスキャン開始
        bluetoothManager.startScanning()
        
        // メッセージを表示
        arView = messageDisplay(arView, coordinator: context.coordinator)

        return arView
    }
    
    func messageDisplay(_ uiView: ARSCNView, coordinator: Coordinator) -> ARSCNView{
        // メッセージ用のUILabelを作成
        let messageLabel = UILabel()
        messageLabel.text = "ARマーカーを写してください"
        messageLabel.textColor = .white
        messageLabel.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.boldSystemFont(ofSize: 16)
        messageLabel.layer.cornerRadius = 10
        messageLabel.clipsToBounds = true
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        // UILabelをARSCNViewに追加
        uiView.addSubview(messageLabel)

        // UILabelの制約を追加
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: uiView.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: uiView.centerYAnchor),
            messageLabel.widthAnchor.constraint(equalToConstant: 250),
            messageLabel.heightAnchor.constraint(equalToConstant: 50)
        ])

        // UILabelをCoordinatorに保持させる
        coordinator.messageLabel = messageLabel

        // 5秒後にUILabelを非表示にする
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            messageLabel.isHidden = true
        }

        return uiView
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(bluetoothManager: bluetoothManager)
    }

    class Coordinator: NSObject, ARSCNViewDelegate {
        var bluetoothManager: BluetoothManager!
        var messageLabel: UILabel?
        
        var greenSphereNode: SCNNode?
        var redSphereNode: SCNNode?
        var blueSphereNode: SCNNode?
        var vectorNode: SCNNode?
        var vectorLabelNode: SCNNode?
        var xLabelNode: SCNNode?
        var yLabelNode: SCNNode?
        var zLabelNode: SCNNode?
        var angle_global: Float = 0

        init(bluetoothManager: BluetoothManager) {
            self.bluetoothManager = bluetoothManager
        }
        
        func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
            if let imageAnchor = anchor as? ARImageAnchor {
                if greenSphereNode == nil {
                    let sphere = SCNSphere(radius: 0.05)
                    sphere.firstMaterial?.diffuse.contents = UIColor.green.withAlphaComponent(0.9)
                    let sphereNode = SCNNode(geometry: sphere)
                    sphereNode.position = SCNVector3(0, -0.2, 0)
                    
                    let arrow = SCNCone(topRadius: 0.01, bottomRadius: 0.03, height: 0.1)
                    arrow.firstMaterial?.diffuse.contents = UIColor.blue.withAlphaComponent(0.9)
                    let arrowNode = SCNNode(geometry: arrow)
                    arrowNode.position = SCNVector3(0, 0.1, 0)
                    arrowNode.eulerAngles.x = -.pi / 2
                    sphereNode.addChildNode(arrowNode)
                    
                    node.addChildNode(sphereNode)
                    greenSphereNode = sphereNode
                } else {
                    SCNTransaction.begin()
                    SCNTransaction.animationDuration = 0.5
                    greenSphereNode?.position = SCNVector3(0, -0.2, 0)
                    SCNTransaction.commit()
                }
            }
        }

        @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
            guard let sceneView = gestureRecognizer.view as? ARSCNView else { return }

            let panLocation = gestureRecognizer.location(in: sceneView)
            let hitTestResults = sceneView.hitTest(panLocation, types: .existingPlaneUsingExtent)

            if let hitResult = hitTestResults.first {
                let position = SCNVector3(
                    hitResult.worldTransform.columns.3.x,
                    hitResult.worldTransform.columns.3.y,
                    hitResult.worldTransform.columns.3.z
                )

                if redSphereNode == nil {
                    let sphere = SCNSphere(radius: 0.05)
                    sphere.firstMaterial?.diffuse.contents = UIColor.orange.withAlphaComponent(0.8)
                    let sphereNode = SCNNode(geometry: sphere)
                    sphereNode.position = position
                    sceneView.scene.rootNode.addChildNode(sphereNode)
                    redSphereNode = sphereNode
                }
                if let redNode = redSphereNode {
                    SCNTransaction.begin()
                    SCNTransaction.animationDuration = 0.1
                    redNode.position = position
                    SCNTransaction.commit()
                    
                    updateVector(with: sceneView)
                }
                if gestureRecognizer.state == .ended {
                    startBlueSphereAnimation(sceneView: sceneView)

                    // ドラッグ終了後、4秒後にメッセージを表示
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        self.messageLabel?.isHidden = false
                        self.messageLabel?.text = "ARマーカーを写してください"
                        
                        // メッセージを5秒間表示した後、再度非表示
                        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                            self.messageLabel?.isHidden = true
                        }
                    }
                }
            }
        }

        func startBlueSphereAnimation(sceneView: ARSCNView) {
            guard let greenNode = greenSphereNode, let redNode = redSphereNode else { return }
            
            let start = redNode.worldPosition
            let end = greenNode.worldPosition

            if blueSphereNode == nil {
                let sphere = SCNSphere(radius: 0.03)
                sphere.firstMaterial?.diffuse.contents = UIColor.blue
                let sphereNode = SCNNode(geometry: sphere)
                sphereNode.position = start
                sceneView.scene.rootNode.addChildNode(sphereNode)
                blueSphereNode = sphereNode
            } else {
                blueSphereNode?.position = start
            }

            if let blueNode = blueSphereNode {
                let toTarget = SCNVector3(
                    (end.x - start.x) * 4 + start.x,
                    (end.y - start.y) * 4 + start.y,
                    (end.z - start.z) * 4 + start.z
                )
                let moveAction = SCNAction.move(to: toTarget, duration: 0.5)
                let distance = distanceBetween(start, end)
                blueNode.runAction(moveAction)
                bluetoothManager.send(mes: "r\(Int(angle_global * 9))")
                sleep(1)
                bluetoothManager.send(mes: String(distance * 1000 * 15))
            }
        }

        func updateVector(with sceneView: ARSCNView) {
            guard let greenNode = greenSphereNode, let redNode = redSphereNode else { return }

            let finger = greenNode.worldPosition
            let start = redNode.worldPosition

            let end = SCNVector3(
                (finger.x - start.x) * 4 + start.x,
                (finger.y - start.y) * 4 + start.y,
                (finger.z - start.z) * 4 + start.z
            )

            let vector = SCNVector3(
                end.x - start.x,
                end.y - start.y,
                end.z - start.z
            )
            
            let distance = distanceBetween(start, end)

            vectorNode?.removeFromParentNode()
            vectorLabelNode?.removeFromParentNode()
            xLabelNode?.removeFromParentNode()
            yLabelNode?.removeFromParentNode()
            zLabelNode?.removeFromParentNode()

            let cylinder = SCNCylinder(radius: 0.005, height: CGFloat(distance))
            cylinder.firstMaterial?.diffuse.contents = UIColor.cyan.withAlphaComponent(0.7)
            let cylNode = SCNNode(geometry: cylinder)

            cylNode.position = SCNVector3(
                (start.x + end.x) / 2,
                (start.y + end.y) / 2,
                (start.z + end.z) / 2
            )

            let normalizedDirection = normalize(vector: vector)
            let up = SCNVector3(0, 1, 0)
            let cross = crossProduct(v1: up, v2: normalizedDirection)
            let dot = dotProduct(v1: up, v2: normalizedDirection)

            let angle: Float
            if cross.x.isNaN || cross.y.isNaN || cross.z.isNaN {
                angle = 0
            } else {
                angle = acos(dot)
            }

            cylNode.rotation = SCNVector4(cross.x, cross.y, cross.z, angle)
            sceneView.scene.rootNode.addChildNode(cylNode)
            vectorNode = cylNode

            let formattedDistance = String(format: "長さ: %.2f m", distance)
            let textGeometry = SCNText(string: formattedDistance, extrusionDepth: 1)
            textGeometry.firstMaterial?.diffuse.contents = UIColor.lightGray
            let textNode = SCNNode(geometry: textGeometry)

            let scaleFactor: Float = 0.01
            textNode.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)

            textNode.position = SCNVector3(
                cylNode.position.x,
                cylNode.position.y + 0.05,
                cylNode.position.z
            )

            let constraint = SCNBillboardConstraint()
            constraint.freeAxes = [.Y]
            textNode.constraints = [constraint]

            sceneView.scene.rootNode.addChildNode(textNode)
            vectorLabelNode = textNode

            let vectorInGreenLocal = greenNode.convertVector(vector, from: sceneView.scene.rootNode)
            let angle_target = atan2(vectorInGreenLocal.x, vectorInGreenLocal.z * -1)
            angle_global = angle_target * 180 / .pi
            
            addComponentLabels(for: vectorInGreenLocal, at: cylNode.position, with: sceneView)
        }

        func addComponentLabels(for vector: SCNVector3, at position: SCNVector3, with sceneView: ARSCNView) {
            let xComponent = String(format: "X: %.2f m", vector.x)
            let yComponent = String(format: "Y: %.2f m", vector.y)
            let zComponent = String(format: "Z: %.2f m", vector.z)
            
            xLabelNode = createLabelNode(text: xComponent, color: UIColor.red)
            yLabelNode = createLabelNode(text: yComponent, color: UIColor.green)
            zLabelNode = createLabelNode(text: zComponent, color: UIColor.blue)
        }

        func createLabelNode(text: String, color: UIColor) -> SCNNode {
            let textGeometry = SCNText(string: text, extrusionDepth: 1)
            textGeometry.firstMaterial?.diffuse.contents = color
            let textNode = SCNNode(geometry: textGeometry)
            textNode.scale = SCNVector3(0.01, 0.01, 0.01)
            let constraint = SCNBillboardConstraint()
            constraint.freeAxes = [.Y]
            textNode.constraints = [constraint]
            return textNode
        }

        func distanceBetween(_ a: SCNVector3, _ b: SCNVector3) -> Float {
            let dx = a.x - b.x
            let dy = a.y - b.y
            let dz = a.z - b.z
            return sqrt(dx*dx + dy*dy + dz*dz)
        }

        func normalize(vector: SCNVector3) -> SCNVector3 {
            let length = sqrt(vector.x * vector.x + vector.y * vector.y + vector.z * vector.z)
            guard length != 0 else { return SCNVector3(0, 0, 0) }
            return SCNVector3(vector.x / length, vector.y / length, vector.z / length)
        }

        func dotProduct(v1: SCNVector3, v2: SCNVector3) -> Float {
            return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
        }

        func crossProduct(v1: SCNVector3, v2: SCNVector3) -> SCNVector3 {
            return SCNVector3(
                v1.y * v2.z - v1.z * v2.y,
                v1.z * v2.x - v1.x * v2.z,
                v1.x * v2.y - v1.y * v2.x
            )
        }
    }
}
