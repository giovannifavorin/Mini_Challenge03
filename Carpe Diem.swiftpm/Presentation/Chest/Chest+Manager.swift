import Foundation
import SpriteKit

extension Chest {
    struct Manager: SceneManager {
        var dataManager: DataManager
        var nextScene: SKScene?
        var stickerAsset: String
        
        init(dataManager: DataManager = .instance, nextScene: SKScene?, stickerAsset: String) {
            self.dataManager = dataManager
            self.nextScene = nextScene
            self.stickerAsset = stickerAsset
        }
        
        mutating func generateNewSticker() {
            dataManager.stickers.append(.init(image: "\(stickerAsset)", position: .zero))
        }
        
        mutating func bindSticker(imageName: String, position: CGPoint) {
            dataManager.stickers.append(Sticker(image: imageName, position: position, isAdded: true))
//            if let last = dataManager.stickers.last {
//                dataManager.stickers.removeLast()
//                dataManager.stickers.append(
//                    .init(image: last.image, position: position, isAdded: true)
//                )
//            } else {
//                
//            }
        }
    }
}
