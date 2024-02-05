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
        
        init(manager: Manager, motoAsset: String, backgroundAsset: String) {
            self.manager = manager
            self.motoAsset = motoAsset
            self.backgroundAsset = backgroundAsset
            super.init()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func didMove(to view: SKView) {
            let background = SKSpriteNode(imageNamed: "\(backgroundAsset)")
            background.size = size  // Configurar o tamanho do background para cobrir toda a cena
            background.position = CGPoint(x: size.width / 2, y: size.height / 2)
            background.zPosition = -1  // Colocar o background atrás de outros nós
            addChild(background)
            
            animateMotorcycle()
            
            
        }
        
        func animateMotorcycle() {
            movingNode = SKSpriteNode(imageNamed: "\(motoAsset)")
            guard let movingNode else { return }
            
            // Criar o nó inicial com uma textura
            movingNode.scale(to: CGSize(width: movingNode.size.width, height: size.height * 0.2))
            
            
            // Configurar o ponto de ancoragem no centro inferior do nó
            movingNode.anchorPoint = CGPoint(x: 1, y: 0)
            
            // Calcular a posição inicial considerando a largura do nó
            movingNode.position = CGPoint(x: movingNode.size.width, y: size.height * 0.1)
            addChild(movingNode)
            
            // Iniciar uma animação para mover o nó pela tela
            let waitAction = SKAction.wait(forDuration: 1.0)
            let moveAction = SKAction.move(to: CGPoint(x: size.width, y: size.height * 0.1), duration: 3.0)
            
            let sequenceAction = SKAction.sequence([waitAction, moveAction])
            
            movingNode.run(sequenceAction) { [weak self] in
                guard let self else { return }
                self.animateDialogBox()
                //                self.manager.goTo(currentView: view)
            }
        }
        
        func animateDialogBox() {
            dialogBox = SKSpriteNode(imageNamed: "dialogBox")
            guard let dialogBox = dialogBox else { return }
            dialogBox.position = CGPoint(x: size.width / 2, y: -dialogBox.size.height)
            dialogBox.zPosition = 2
            addChild(dialogBox)
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: dialogBox.size.height / 1.8), duration: 0.7)
            
            dialogBox.run(SKAction.group([moveAction]))
            
            let dialog = textFormatter()
            dialogBox.addChild(dialog)
            
            buttonNode = SKSpriteNode(imageNamed: "openEye")
            guard let buttonNode else { return }
            buttonNode.scale(to: CGSize(width: buttonNode.size.width, height: buttonNode.size.height))
            buttonNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
            
            addChild(buttonNode)
        }
        
        func textFormatter() -> SKLabelNode{
            let dialog = SKLabelNode(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum")
            dialog.fontSize = 40
            dialog.numberOfLines = 4
            dialog.zPosition = 4
            dialog.verticalAlignmentMode = .center
            dialog.lineBreakMode = .byWordWrapping
            dialog.fontColor = .black
            dialog.preferredMaxLayoutWidth = 200
            dialog.preferredMaxLayoutWidth = size.width * 0.71
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
