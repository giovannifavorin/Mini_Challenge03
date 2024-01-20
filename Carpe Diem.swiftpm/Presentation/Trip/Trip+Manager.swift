import Foundation
import SpriteKit

extension Trip {
    struct Manager: SceneManager {
        var nextScene: SKScene?
        
        init(nextScene: SKScene?) {
            self.nextScene = nextScene
        }
    }
}
