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
    
    override func didMove(to view: SKView) {
        
        let node = dragNode()
        node.position = CGPoint(x: 500, y: 500)
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
            let nodes = nodes(at: location)
            
            if let ovo = atPoint(location) as? dragNode {
                //                if !isGrudado {
                //                    card.position = location
                //                }
                ovo.position = location
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            let nodes = nodes(at: location)
            
//            if let ovo = atPoint(location) as? dragNode {
//                for node in nodes {
//                    if node == borderNode {
//                        isGrudado = true
//                    } else if node != borderNode {
//                        isGrudado = false
//                    }
//                    print("\(isGrudado)")
//                }
//            }
            
            if let ovo = atPoint(location) as? dragNode {
                let isSobreBorderNode = nodes.contains(borderNode!)
                
                if isSobreBorderNode {
                    isGrudado = true
                } else {
                    isGrudado = false
                }
                print("\(isGrudado)")
            }
            
        }
        
        let buttonNode = SKSpriteNode(color: .green, size: CGSize(width: 400, height: 400))
        if isGrudado == true {
            addChild(buttonNode)
        } else if isGrudado == false{
            buttonNode.removeFromParent()
        }
    }
}

class dragNode: SKSpriteNode {
    let nodeTexture: SKTexture
    let nodeSize: CGSize
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init() {
        self.nodeTexture = SKTexture(imageNamed: "Ellipse")
        self.nodeSize = CGSize(width: 250, height: 250)
        
        super.init(texture: nodeTexture, color: .clear, size: nodeSize)
    }
    
}
