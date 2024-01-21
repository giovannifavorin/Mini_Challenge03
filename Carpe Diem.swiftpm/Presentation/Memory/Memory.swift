import SpriteKit

enum Memory {
    static func build(nextScene: SKScene? = nil, backgroundAsset: String) -> SKScene {
        Scene(manager: .init(nextScene: nextScene), backgroundAsset: backgroundAsset)
    }
}

