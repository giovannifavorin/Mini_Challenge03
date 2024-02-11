import SpriteKit

//Nesse arquivo, deve ficar o código para lembrança1

extension Memory {
    class Scene: GameScene {
        let manager: Manager
        var backgroundAsset: String
        var textDialog: String
        var buttonNode: SKSpriteNode?
        var dialogBox: SKSpriteNode?
        
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
            
            self.animateDialogBox(textDialog: textDialog)
        }
        
        func animateDialogBox(textDialog:String) {
            dialogBox = SKSpriteNode(imageNamed: "dialogBox")
            guard let dialogBox = dialogBox else { return }
            dialogBox.scale(to: CGSize(width: size.width * 0.97, height: dialogBox.frame.height))
            dialogBox.position = CGPoint(x: size.width / 2, y: -dialogBox.size.height)
            dialogBox.zPosition = 2
            addChild(dialogBox)
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: dialogBox.size.height / 1.8), duration: 0.7)
            
            dialogBox.run(SKAction.group([moveAction]))
            
            let dialog = textFormatter(textDialog: textDialog)
            dialogBox.addChild(dialog)
            
            buttonNode = SKSpriteNode(imageNamed: "openEye")
            guard let buttonNode else { return }
            buttonNode.scale(to: CGSize(width: buttonNode.size.width, height: buttonNode.size.height))
            buttonNode.position = CGPoint(x: size.width / 15, y: size.height / 2.4)
            
            addChild(buttonNode)
        }
        
        func textFormatter(textDialog:String) -> SKLabelNode {
            let dialog = SKLabelNode(text: textDialog)
            dialog.fontSize = 36
            dialog.numberOfLines = 5
            dialog.zPosition = 4
            dialog.verticalAlignmentMode = .center
            dialog.lineBreakMode = .byWordWrapping
            dialog.fontColor = .white
            dialog.preferredMaxLayoutWidth = 200
            dialog.preferredMaxLayoutWidth = super.size.width * 0.8
            return dialog
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
