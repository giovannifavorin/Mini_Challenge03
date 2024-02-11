import SpriteKit

enum Chest {
    static func build(nextScene: SKScene? = nil, stickerAsset: String, textEnum : chestText? = nil) -> SKScene {
        Scene(manager: .init(nextScene: nextScene, stickerAsset: stickerAsset), chestText: textEnum)
    }
}
