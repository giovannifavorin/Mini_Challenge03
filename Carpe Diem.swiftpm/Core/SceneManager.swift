import SpriteKit

protocol SceneManager {
    var nextScene: SKScene? { get }
    
    func goTo(currentView: SKView?, transition: SKTransition)
}

extension SceneManager {
    func goTo(currentView: SKView?, transition: SKTransition = .crossFade(withDuration: 1.0))  {
        guard let currentView, let nextScene else { return }
        currentView.presentScene(nextScene, transition: transition)
    }
}
