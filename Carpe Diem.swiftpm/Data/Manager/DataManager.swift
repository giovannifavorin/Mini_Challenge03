import SpriteKit

struct DataManager {
    var screenSize: CGSize = .zero
    var scaleMode: SKSceneScaleMode = .aspectFill
    var stickers: [Sticker] = .init()
    
    static var instance = DataManager()
    
    private init() {}
}

