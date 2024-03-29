import Foundation
import SpriteKit

extension Memory {
    struct Manager: SceneManager {
        var nextScene: SKScene?
        
        init(nextScene: SKScene?) {
            self.nextScene = nextScene
        }
    }
}
