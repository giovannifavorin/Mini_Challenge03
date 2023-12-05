//
//  SpriteMoto.swift
//  Carpe Diem
//
//  Created by Giovanni Favorin de Melo on 29/11/23.
//

import SpriteKit

class Moto: SKScene {
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.blue
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let view = self.view {
            let nextScene = Chest(size: self.size) 
            nextScene.scaleMode = self.scaleMode
            view.presentScene(nextScene, transition: SKTransition.fade(withDuration: 1.0))
        }
    }
}
