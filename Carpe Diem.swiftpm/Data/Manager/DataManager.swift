import SpriteKit

class DataManager {
    var screenSize: CGSize = .zero
    var scaleMode: SKSceneScaleMode = .aspectFill
    var stickers: [Sticker] = .init()
    
    let textArray: [String] = [
        "aaaaa", "bbbb", "cccc"
    ]

    
    static var instance = DataManager()

    private init() {}
}

