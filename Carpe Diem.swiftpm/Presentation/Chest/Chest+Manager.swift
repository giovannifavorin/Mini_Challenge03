import Foundation
import SpriteKit

extension Chest {
    struct Manager: SceneManager {
        var dataManager: DataManager
        var nextScene: SKScene?
        
        init(dataManager: DataManager = .instance, nextScene: SKScene?) {
            self.dataManager = dataManager
            self.nextScene = nextScene
        }
        
        mutating func generateNewSticker() {
            dataManager.stickers.append(.init(image: "", position: .zero))
        }
        
        mutating func bindSticker(position: CGPoint) {
            if let last = dataManager.stickers.last {
                dataManager.stickers.removeLast()
                dataManager.stickers.append(
                    .init(image: last.image, position: position, isAdded: true)
                )
            }
        }
    }
}
