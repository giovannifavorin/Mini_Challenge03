//
//  Draggable.swift
//  Carpe Diem
//
//  Created by Giovanni Favorin de Melo on 04/12/23.
//

import SpriteKit

class Draggable: SKScene {
    var borderNode: SKSpriteNode?
    var isGrudado: Bool = false
    var buttonNode: SKSpriteNode?
    var screenSize = UIScreen.main.bounds.size
    
    
    override func didMove(to view: SKView) {
        self.screenSize = self.size
        let node = dragNode(screenSize: screenSize)
        node.position = CGPoint(x: screenSize.width / 2, y: screenSize.height / 2)
        
        addChild(node)
        
        let borderRect = CGRect(x: -250, y: -250, width: 700, height: 700)
        borderNode = SKSpriteNode(color: .red, size: borderRect.size)
        if let borderNode {
            borderNode.zPosition = -1
            borderNode.position = CGPoint(x: 100, y: 100)
            addChild(borderNode)
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if let ovo = atPoint(location) as? dragNode {
                ovo.position = location
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let nodes = nodes(at: location)
            let isSobreBorderNode = nodes.contains(borderNode!)
            
            if isSobreBorderNode {
                isGrudado = true
            } else {
                isGrudado = false
                
                if let buttonNode = buttonNode {
                    buttonNode.removeFromParent()
                    self.buttonNode = nil
                }
            }
            print("\(isGrudado)")
        }
        
#warning("FIX área de sobreposição - os quatro cantos do node +")
#warning("FIX bug de movimento rápido do drag ++")
#warning("ADD salvar localização do adesivo - UserDefault")
        
        if isGrudado == true && buttonNode == nil {
            buttonNode = SKSpriteNode(color: .green, size: CGSize(width: screenSize.width * 0.5, height: screenSize.height * 0.5))
            buttonNode?.position = CGPoint(x: screenSize.width - buttonNode!.size.width / 2, y: buttonNode!.size.height / 2)
            
            addChild(buttonNode!)
        }
    }
}

class dragNode: SKSpriteNode {
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
