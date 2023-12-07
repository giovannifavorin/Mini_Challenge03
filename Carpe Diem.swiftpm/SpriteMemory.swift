//
//  SpriteMemory.swift
//  Carpe Diem
//
//  Created by Giovanni Favorin de Melo on 01/12/23.
//

import SpriteKit

class Memory: SKScene {
    
    var meuBotao: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        // Configuração do fundo amarelo
        self.backgroundColor = SKColor.yellow
        
        // Criação do botão roxo
        let texturaDoBotao = UIColor.orange
        meuBotao = SKSpriteNode(color: texturaDoBotao, size: CGSize(width: size.width / 2, height: size.height / 2))
        meuBotao.position = CGPoint(x: size.width / 2, y: size.height / 2)
        meuBotao.name = "meuBotao"
        
        addChild(meuBotao)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if meuBotao.contains(location) {
                // O botão foi pressionado
                print("Botão pressionado!")
                
                if let view = self.view {
                    let nextScene = Draggable(size: self.size)
                    nextScene.scaleMode = self.scaleMode
                    view.presentScene(nextScene, transition: SKTransition.fade(withDuration: 1.0))
                }
            }
        }
    }
}
