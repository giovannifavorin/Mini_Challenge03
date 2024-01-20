import SpriteKit

enum Memory {
    static func build(nextScene: SKScene? = nil) -> SKScene {
        Scene(manager: .init(nextScene: nextScene))
    }
}

