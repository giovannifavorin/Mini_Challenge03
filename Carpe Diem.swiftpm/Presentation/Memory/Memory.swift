import SpriteKit

enum Memory {
    static func build(nextScene: SKScene? = nil, backgroundAsset: String, textEnum : memoryText) -> SKScene {
        Scene(manager: .init(nextScene: nextScene), backgroundAsset: backgroundAsset, text: textEnum)
    }
}

