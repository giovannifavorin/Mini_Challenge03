import SpriteKit

///Tentativa agora pra usar protocol, é bom para q eu possa ter várias configuracoes de display de texto
protocol TextDisplayable {
    func createDialogBox(inScene scene: SKScene) -> SKSpriteNode
    func createButtonNode(inScene scene: SKScene) -> SKSpriteNode
    func textFormatter(inScene scene: SKScene, textDialog: String) -> SKLabelNode
}

extension TextDisplayable {
    func animateDialogBox(inScene scene: SKScene, textDialog: String) -> (SKSpriteNode, SKSpriteNode, SKLabelNode) {
        let dialogBox = createDialogBox(inScene: scene)
        let moveAction = SKAction.move(to: CGPoint(x: scene.size.width / 2, y: dialogBox.size.height / 1.8), duration: 0.7)
        dialogBox.run(SKAction.group([moveAction]))

        let dialogLabel = textFormatter(inScene: scene, textDialog: textDialog)
        dialogBox.addChild(dialogLabel)

        let buttonNode = createButtonNode(inScene: scene)

        return (dialogBox, buttonNode, dialogLabel)
    }
}

class TextUtil: TextDisplayable {
    func createDialogBox(inScene scene: SKScene) -> SKSpriteNode {
        let dialogBox = SKSpriteNode(imageNamed: "dialogBox")
        dialogBox.scale(to: CGSize(width: scene.size.width * 0.97, height: dialogBox.frame.height))
        dialogBox.position = CGPoint(x: scene.size.width / 2, y: -dialogBox.size.height)
        dialogBox.zPosition = 2
        scene.addChild(dialogBox)
        return dialogBox
    }

    func createButtonNode(inScene scene: SKScene) -> SKSpriteNode {
        let buttonNode = SKSpriteNode(imageNamed: "openEye")
        buttonNode.scale(to: CGSize(width: buttonNode.size.width, height: buttonNode.size.height))
        buttonNode.position = CGPoint(x: scene.size.width / 15, y: scene.size.height / 2.4)
        scene.addChild(buttonNode)
        return buttonNode
    }

    func textFormatter(inScene scene: SKScene, textDialog: String) -> SKLabelNode {
        let dialog = SKLabelNode(text: textDialog)
        dialog.fontSize = 36
        dialog.numberOfLines = 5
        dialog.zPosition = 4
        dialog.verticalAlignmentMode = .center
        dialog.lineBreakMode = .byWordWrapping
        dialog.fontColor = .white
        dialog.preferredMaxLayoutWidth = 200
        dialog.preferredMaxLayoutWidth = scene.size.width * 0.8
        return dialog
    }
}

class YourScene: SKScene {
    let textUtil: TextDisplayable = TextUtil()

    func showAnimatedDialogBox(textDialog: String) {
        let (dialogBox, buttonNode, dialogLabel) = textUtil.animateDialogBox(inScene: self, textDialog: textDialog)
        
        // Faça mais customizações ou manipulações conforme necessário
    }
}

