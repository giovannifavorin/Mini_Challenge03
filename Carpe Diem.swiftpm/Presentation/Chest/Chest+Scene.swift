import SpriteKit

//Esse arquivo, deve ficar o código para as interatividades e configurações do baú

extension Chest {
    class Scene: GameScene {
        var chestComponentNode: SKSpriteNode?
        var buttonNode: SKSpriteNode?
        var currentSticker: SKSpriteNode?
        
        var manager: Manager
        
        init(manager: Manager) {
            self.manager = manager
            super.init()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func didMove(to view: SKView) {
            for sticker in self.manager.dataManager.stickers {
                let node = StickerNode(screenSize: size)
                node.position = sticker.position
                node.isUserInteractionEnabled = false
                
                addChild(node)
            }
            
            self.manager.generateNewSticker()
            
            currentSticker = StickerNode(screenSize: size)
            if let currentSticker {
                currentSticker.position = CGPoint(x: size.width / 2, y: size.height / 2)
                addChild(currentSticker)
            }
            
            chestComponentNode = SKSpriteNode(imageNamed: "chest")
            if let chestComponentNode {
                chestComponentNode.zPosition = -1
                chestComponentNode.scale(to: CGSize(width: size.width * 0.7, height: size.height * 0.75))
                chestComponentNode.position = CGPoint(x:self.size.width / 2, y: self.size.height / 2)
                addChild(chestComponentNode)
            }
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                guard let buttonNode, let currentSticker else {return}
                if buttonNode.frame.contains(touch.location(in: self)) {
                    manager.bindSticker(position: currentSticker.position)
                    manager.goTo(currentView: view)
                }
            }
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                let location = touch.location(in: self)
                
                if let stickerNode = atPoint(location) as? StickerNode, stickerNode == currentSticker {
                    stickerNode.position = location
                }
            }
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            for _ in touches {
                guard let currentSticker, let chestComponentNode else { return }
                let isStickerOnChest = chestComponentNode.isOverlapped(node: currentSticker)
                
                if !isStickerOnChest {
                    if let buttonNode = buttonNode {
                        buttonNode.removeFromParent()
                        self.buttonNode = nil
                    }
                } else {
                    if buttonNode == nil {
                        buttonNode = SKSpriteNode(imageNamed: "confirmButton")
                        guard let buttonNode else { return }
                        buttonNode.scale(to: CGSize(width: buttonNode.size.width, height: buttonNode.size.height))
                        buttonNode.position = CGPoint(x: size.width - buttonNode.size.width / 2, y: buttonNode.size.height / 2)
                        
                        addChild(buttonNode)
                    }
                }
            }
#warning("FIX bug de movimento rápido do drag ++")
        }
    }
    
    class StickerNode: SKSpriteNode {
        let nodeTexture: SKTexture
        let nodeSize: CGSize
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("NSCoding not supported")
        }
        
        init(screenSize: CGSize) {
            let newSize = CGSize(width: screenSize.width * 0.2, height: screenSize.width * 0.2)
            
            self.nodeTexture = SKTexture(imageNamed: "Ellipse")
            self.nodeSize = newSize
            
            super.init(texture: nodeTexture, color: .clear, size: nodeSize)
        }
    }
}
