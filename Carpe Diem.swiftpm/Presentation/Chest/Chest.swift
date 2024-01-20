import SpriteKit

enum Chest {
    static func build(nextScene: SKScene? = nil) -> SKScene {
        Scene(manager: .init(nextScene: nextScene))
    }
}
