import SpriteKit

enum Trip {
    static func build(nextScene: SKScene? = nil, motoAsset: String, backgroundAsset: String) -> SKScene {
        Scene(manager: .init(nextScene: nextScene), motoAsset: motoAsset, backgroundAsset: backgroundAsset)
    }
}
