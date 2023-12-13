import SpriteKit

class MovingNodeScene: SKScene {
    
    var movingNode: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        // Criar o nó inicial com uma textura
        movingNode = SKSpriteNode(imageNamed: "Ellipse")
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
#warning("possibilidades - parallax++, SKCameraNode")
        movingNode.run(sequenceAction) {
            self.transitionToNextScene()
        }
    }
    
    func transitionToNextScene() {
        // Criar a próxima cena que você deseja transicionar
        let nextScene = Chest(size: size)
        
        // Configurar uma transição de cena (por exemplo, cruz dissolve)
        let transition = SKTransition.crossFade(withDuration: 1.0)
        
        // Apresentar a próxima cena com a transição
        view?.presentScene(nextScene, transition: transition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            print("\(touch.location(in: view))")
        }
    }
}
