import SpriteKit

//Nesse arquivo, deve ficar o código para lembrança1

extension Memory {
    class Scene: GameScene {
        let manager: Manager
        var backgroundAsset: String
        var textDialog: String
        var buttonNode: SKSpriteNode?
        var dialogBox: SKSpriteNode?
        let textUtil: TextDisplayable = TextUtil()
        
        init(manager: Manager, backgroundAsset: String, text: memoryText) {
            self.manager = manager
            self.backgroundAsset = backgroundAsset
            self.textDialog = text.rawValue
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
            
            let (dialogBox, buttonNode) = textUtil.animateDialogBox(inScene: self, textDialog: textDialog)
            self.dialogBox = dialogBox
            self.buttonNode = buttonNode
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                guard let buttonNode = buttonNode, let dialogBox = dialogBox else { return }
                
                if buttonNode.frame.contains(touch.location(in: self)) {
                    print("Botão pressionado")
                
                    if dialogBox.parent == nil {
                        addChild(dialogBox)
                    } else {
                        dialogBox.removeFromParent()
                    }
                } else {
                    self.manager.goTo(currentView: view)
                }
            }
        }
    }
}
