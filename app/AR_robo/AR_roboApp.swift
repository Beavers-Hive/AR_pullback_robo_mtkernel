import ARKit
import SwiftUI
import SceneKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView()
        let configuration = ARWorldTrackingConfiguration()

        // ARReferenceImageのセットアップ
        if let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) {
            configuration.detectionImages = referenceImages
            configuration.maximumNumberOfTrackedImages = 1 // 同時にトラッキングする画像の数
        }
        configuration.planeDetection = .horizontal

        arView.session.run(configuration)
        arView.delegate = context.coordinator

        // タップジェスチャーの追加
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        arView.addGestureRecognizer(tapGesture)

        return arView
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, ARSCNViewDelegate {
        // 保持するノード
        var greenSphereNode: SCNNode?
        var redSphereNode: SCNNode?
        var vectorNode: SCNNode?
        var vectorLabelNode: SCNNode? // ベクトルの長さを表示するノード
        var xLabelNode: SCNNode? // X成分を表示するノード
        var yLabelNode: SCNNode? // Y成分を表示するノード
        var zLabelNode: SCNNode? // Z成分を表示するノード

        // 画像が検出された時の処理
        func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
            if let imageAnchor = anchor as? ARImageAnchor {
                // 既に緑球が存在する場合は更新する
                if greenSphereNode == nil {
                    // 緑球の作成
                    let sphere = SCNSphere(radius: 0.05)
                    sphere.firstMaterial?.diffuse.contents = UIColor.green
                    let sphereNode = SCNNode(geometry: sphere)
                    sphereNode.position = SCNVector3(0, 0, 0) // 画像アンカーの原点に配置
                    
                    // 矢印（向きを示すノード）を追加
                    let arrow = SCNCone(topRadius: 0.01, bottomRadius: 0.03, height: 0.1)
                    arrow.firstMaterial?.diffuse.contents = UIColor.blue
                    let arrowNode = SCNNode(geometry: arrow)
                    arrowNode.position = SCNVector3(0, 0.1, 0) // 矢印を球の上に配置
                    arrowNode.eulerAngles.x = -.pi / 2 // 矢印を上向きに回転
                    sphereNode.addChildNode(arrowNode)
                    
                    node.addChildNode(sphereNode)
                    greenSphereNode = sphereNode
                } else {
                    // 既存の緑球を更新
                    SCNTransaction.begin()
                    SCNTransaction.animationDuration = 0.5
                    greenSphereNode?.position = SCNVector3(0, 0, 0) // 画像アンカーの原点に再配置
                    SCNTransaction.commit()
                }
            }
        }
        
        // 画像のトラッキングが更新された場合の処理
        func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
            if let imageAnchor = anchor as? ARImageAnchor, let sphereNode = greenSphereNode {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                sphereNode.position = SCNVector3(0, 0, 0) // 画像アンカーの原点に再配置
                SCNTransaction.commit()
            }
        }

        // タッチされた場所に赤い球を置く処理
        @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
            guard let sceneView = gestureRecognizer.view as? ARSCNView else { return }
            let tapLocation = gestureRecognizer.location(in: sceneView)
            let hitTestResults = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
            
            if let hitResult = hitTestResults.first {
                let position = SCNVector3(
                    hitResult.worldTransform.columns.3.x,
                    hitResult.worldTransform.columns.3.y,
                    hitResult.worldTransform.columns.3.z
                )
                
                // 既に赤球が存在する場合は更新する
                if redSphereNode == nil {
                    let sphere = SCNSphere(radius: 0.05)
                    sphere.firstMaterial?.diffuse.contents = UIColor.red
                    let sphereNode = SCNNode(geometry: sphere)
                    sphereNode.position = position
                    sceneView.scene.rootNode.addChildNode(sphereNode)
                    redSphereNode = sphereNode
                } else {
                    // 既存の赤球を更新
                    SCNTransaction.begin()
                    SCNTransaction.animationDuration = 0.5
                    redSphereNode?.position = position
                    SCNTransaction.commit()
                }
                
                updateVector(with: sceneView)
            }
        }
        
        // 緑球から赤球へのベクトルを更新
        func updateVector(with sceneView: ARSCNView) {
            guard let greenNode = greenSphereNode, let redNode = redSphereNode else { return }
            
            // 緑球と赤球のワールド座標を取得
            let start = greenNode.worldPosition
            let end = redNode.worldPosition
            
            // ベクトルを緑球を原点とした相対ベクトルに計算
            let vector = SCNVector3(
                end.x - start.x,
                end.y - start.y,
                end.z - start.z
            )
            let distance = distanceBetween(start, end)
            
            // 既存のベクトルノードとラベルノードを削除
            vectorNode?.removeFromParentNode()
            vectorLabelNode?.removeFromParentNode()
            xLabelNode?.removeFromParentNode()
            yLabelNode?.removeFromParentNode()
            zLabelNode?.removeFromParentNode()
            
            // ベクトルを表現するシリンダーを作成
            let cylinder = SCNCylinder(radius: 0.005, height: CGFloat(distance))
            cylinder.firstMaterial?.diffuse.contents = UIColor.yellow
            let cylNode = SCNNode(geometry: cylinder)
            
            // ベクトルの中央に配置
            cylNode.position = SCNVector3(
                (start.x + end.x) / 2,
                (start.y + end.y) / 2,
                (start.z + end.z) / 2
            )
            
            // ベクトルの向きに回転
            let normalizedDirection = normalize(vector: vector)
            let up = SCNVector3(0, 1, 0)
            let cross = crossProduct(v1: up, v2: normalizedDirection)
            let dot = dotProduct(v1: up, v2: normalizedDirection)
            
            // ベクトルが垂直な場合の処理を追加
            let angle: Float
            if cross.x.isNaN || cross.y.isNaN || cross.z.isNaN {
                angle = 0
            } else {
                angle = acos(dot)
            }
            
            cylNode.rotation = SCNVector4(cross.x, cross.y, cross.z, angle)
            
            // ベクトルノードをシーンのルートノードに追加
            sceneView.scene.rootNode.addChildNode(cylNode)
            vectorNode = cylNode
            
            // ベクトルの長さを表示するテキストノードを作成
            let formattedDistance = String(format: "長さ: %.2f m", distance)
            let textGeometry = SCNText(string: formattedDistance, extrusionDepth: 1)
            textGeometry.firstMaterial?.diffuse.contents = UIColor.white
            let textNode = SCNNode(geometry: textGeometry)
            
            // テキストのスケールを調整
            let scaleFactor: Float = 0.01
            textNode.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
            
            // テキストノードをベクトルの中央に配置し、少し上にオフセット
            textNode.position = SCNVector3(
                cylNode.position.x,
                cylNode.position.y + 0.05, // y軸方向に0.05m上にオフセット
                cylNode.position.z
            )
            
            // テキストが常にカメラを向くようにビルボード制約を追加
            let constraint = SCNBillboardConstraint()
            constraint.freeAxes = [.Y] // Y軸は固定し、他の軸は自由に回転
            textNode.constraints = [constraint]
            
            // テキストノードをシーンのルートノードに追加
            sceneView.scene.rootNode.addChildNode(textNode)
            vectorLabelNode = textNode
            
            // ベクトルの各成分を表示するテキストノードを作成
            addComponentLabels(for: normalizedDirection, at: cylNode.position, with: sceneView)
        }
        
        // ベクトルの各成分を表示するテキストノードを作成
        func addComponentLabels(for vector: SCNVector3, at position: SCNVector3, with sceneView: ARSCNView) {
            // 各成分をフォーマット
            let xComponent = String(format: "X: %.2f m", vector.x)
            let yComponent = String(format: "Y: %.2f m", vector.y)
            let zComponent = String(format: "Z: %.2f m", vector.z)
            
            // X成分のテキストノードを作成
            xLabelNode = createLabelNode(text: xComponent, color: UIColor.red)
            if let xLabel = xLabelNode {
                // X成分の位置をベクトルの中央からX軸方向にオフセット
                xLabel.position = SCNVector3(position.x + Float(vector.x) / 2, position.y, position.z)
                sceneView.scene.rootNode.addChildNode(xLabel)
            }
            
            // Y成分のテキストノードを作成
            yLabelNode = createLabelNode(text: yComponent, color: UIColor.green)
            if let yLabel = yLabelNode {
                // Y成分の位置をベクトルの中央からY軸方向にオフセット
                yLabel.position = SCNVector3(position.x, position.y + Float(vector.y) / 2 + 0.05, position.z)
                sceneView.scene.rootNode.addChildNode(yLabel)
            }
            
            // Z成分のテキストノードを作成
            zLabelNode = createLabelNode(text: zComponent, color: UIColor.blue)
            if let zLabel = zLabelNode {
                // Z成分の位置をベクトルの中央からZ軸方向にオフセット
                zLabel.position = SCNVector3(position.x, position.y, position.z + Float(vector.z) / 2)
                sceneView.scene.rootNode.addChildNode(zLabel)
            }
        }
        
        // ラベルノードを作成するヘルパーメソッド
        func createLabelNode(text: String, color: UIColor) -> SCNNode {
            let textGeometry = SCNText(string: text, extrusionDepth: 1)
            textGeometry.firstMaterial?.diffuse.contents = color
            let textNode = SCNNode(geometry: textGeometry)
            
            // テキストのスケールを調整
            let scaleFactor: Float = 0.01
            textNode.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
            
            // テキストが常にカメラを向くようにビルボード制約を追加
            let constraint = SCNBillboardConstraint()
            constraint.freeAxes = [.Y] // Y軸は固定し、他の軸は自由に回転
            textNode.constraints = [constraint]
            
            return textNode
        }
        
        // ヘルパー関数: ベクトルの距離を計算
        func distanceBetween(_ a: SCNVector3, _ b: SCNVector3) -> Float {
            let dx = a.x - b.x
            let dy = a.y - b.y
            let dz = a.z - b.z
            return sqrt(dx*dx + dy*dy + dz*dz)
        }
        
        // ヘルパー関数: ベクトルを正規化
        func normalize(vector: SCNVector3) -> SCNVector3 {
            let length = sqrt(vector.x * vector.x + vector.y * vector.y + vector.z * vector.z)
            guard length != 0 else { return SCNVector3(0, 0, 0) }
            return SCNVector3(vector.x / length, vector.y / length, vector.z / length)
        }
        
        // ヘルパー関数: ドット積
        func dotProduct(v1: SCNVector3, v2: SCNVector3) -> Float {
            return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
        }
        
        // ヘルパー関数: クロス積
        func crossProduct(v1: SCNVector3, v2: SCNVector3) -> SCNVector3 {
            return SCNVector3(
                v1.y * v2.z - v1.z * v2.y,
                v1.z * v2.x - v1.x * v2.z,
                v1.x * v2.y - v1.y * v2.x
            )
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
//            Text("AR Robo μT-Kernel")
            List{
                NavigationLink(destination: ARDragViewContainer()) {
                    Text("AR DragCar")
     
                }
                NavigationLink(destination: ARViewContainer()) {
                    Text("PointMode")
                }
            }
            .navigationTitle("AR Robo μT-Kernel")
        }
    }
}

@main
struct AR_roboApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
