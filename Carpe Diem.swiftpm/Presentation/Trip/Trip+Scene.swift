import SpriteKit

//esse arquivo contém a cena 1
extension Trip {
    class Scene: GameScene {
        var movingNode: SKSpriteNode?
        let manager: Manager
        var motoAsset: String
        var backgroundAsset: String
        var buttonNode: SKSpriteNode?
        var dialogBox: SKSpriteNode?
        var textDialog: String
        let textUtil: TextDisplayable = TextUtil()
        
        init(manager: Manager, motoAsset: String, backgroundAsset: String, text: tripText) {
            self.manager = manager
            self.motoAsset = motoAsset
            self.backgroundAsset = backgroundAsset
            self.textDialog = text.rawValue
            super.init()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func didMove(to view: SKView) {
            let background = SKSpriteNode(imageNamed: "\(backgroundAsset)")
            background.size = size
            background.position = CGPoint(x: size.width / 2, y: size.height / 2)
            background.zPosition = -1
            addChild(background)
            
            animateMotorcycle()
        }
        
        func animateMotorcycle() {
            movingNode = SKSpriteNode(imageNamed: "\(motoAsset)")
            guard let movingNode else { return }
            
            movingNode.scale(to: CGSize(width: movingNode.size.width, height: size.height * 0.2))
            
            movingNode.anchorPoint = CGPoint(x: 1, y: 0)
            
            movingNode.position = CGPoint(x: movingNode.size.width, y: size.height * 0.1)
            addChild(movingNode)
            
            let waitAction = SKAction.wait(forDuration: 0.5)
            let moveAction = SKAction.move(to: CGPoint(x: size.width, y: size.height * 0.1), duration: 3.0)
            
            let sequenceAction = SKAction.sequence([waitAction, moveAction])
            
            movingNode.run(sequenceAction) { [weak self] in
                guard let self else { return }
                let (dialogBox, buttonNode) = textUtil.animateDialogBox(inScene: self, textDialog: textDialog)
                self.dialogBox = dialogBox
                self.buttonNode = buttonNode
            }
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
