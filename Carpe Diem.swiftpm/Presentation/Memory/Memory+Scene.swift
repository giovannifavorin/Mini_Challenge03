import SpriteKit

//Nesse arquivo, deve ficar o código para lembrança1

extension Memory {
    class Scene: GameScene {
        let manager: Manager
        
        init(manager: Manager) {
            self.manager = manager
            super.init()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func didMove(to view: SKView) {
            let fundo = SKSpriteNode(imageNamed: "Pixel") // Substitua "suaImagemDeFundo" pelo nome da sua imagem
            fundo.size = self.size // Define o tamanho do nó igual ao tamanho da cena
            fundo.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2) // Posiciona o nó no centro da cena
            fundo.zPosition = -1 // Coloca o fundo atrás de outros nós
            print(size.width)
            print(size.height)
            print(size)
            addChild(fundo)
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            manager.goTo(currentView: view)
        }
    }
}
