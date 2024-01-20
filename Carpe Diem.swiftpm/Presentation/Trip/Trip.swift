import SpriteKit

enum Trip {
    static func build(nextScene: SKScene? = nil) -> SKScene {
        Scene(manager: .init(nextScene: nextScene))
    }
}
