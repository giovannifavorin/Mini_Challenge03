import SpriteKit

//esse arquivo contém a cena 1
extension Trip {
    class Scene: GameScene {
        var movingNode: SKSpriteNode?
        let manager: Manager
        
        init(manager: Manager) {
            self.manager = manager
            super.init()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func didMove(to view: SKView) {
            movingNode = SKSpriteNode(imageNamed: "Ellipse")
            guard let movingNode else { return }
            
            // Criar o nó inicial com uma textura
            movingNode.scale(to: CGSize(width: size.width * 0.2, height: size.width * 0.2))
            
            // Configurar o ponto de ancoragem no centro inferior do nó
            movingNode.anchorPoint = CGPoint(x: 1, y: 0)
            
            // Calcular a posição inicial considerando a largura do nó
            movingNode.position = CGPoint(x: movingNode.size.width, y: 0)
            addChild(movingNode)
            
            // Iniciar uma animação para mover o nó pela tela
            let waitAction = SKAction.wait(forDuration: 1.0)
            let moveAction = SKAction.move(to: CGPoint(x: size.width, y: 0), duration: 3.0)
            
            let sequenceAction = SKAction.sequence([waitAction, moveAction])
            
            movingNode.run(sequenceAction) { [weak self] in
                guard let self else { return }
                self.manager.goTo(currentView: view)
            }
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                print("\(touch.location(in: view))")
            }
        }
    }
}
