import SpriteKit

class GameScene: SKScene {
    init(
        size: CGSize = DataManager.instance.screenSize,
        scaleMode: SKSceneScaleMode = DataManager.instance.scaleMode
    ) {
        super.init(size: size)
        self.scaleMode = scaleMode
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
