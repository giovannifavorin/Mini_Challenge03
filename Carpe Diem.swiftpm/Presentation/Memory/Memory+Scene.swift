import SpriteKit

//Nesse arquivo, deve ficar o código para lembrança1

extension Memory {
    class Scene: GameScene {
        let manager: Manager
        var backgroundAsset: String
        
        init(manager: Manager, backgroundAsset: String) {
            self.manager = manager
            self.backgroundAsset = backgroundAsset
            super.init()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func didMove(to view: SKView) {
            let fundo = SKSpriteNode(imageNamed: "\(backgroundAsset)")
            fundo.size = self.size
            fundo.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
            fundo.zPosition = -1
            addChild(fundo)
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            manager.goTo(currentView: view)
        }
    }
}
