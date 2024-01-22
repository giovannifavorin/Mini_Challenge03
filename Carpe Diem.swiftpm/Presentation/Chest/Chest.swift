import SpriteKit

enum Chest {
    static func build(nextScene: SKScene? = nil, stickerAsset: String) -> SKScene {
        Scene(manager: .init(nextScene: nextScene, stickerAsset: stickerAsset))
    }
}
