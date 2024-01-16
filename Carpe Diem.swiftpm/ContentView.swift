import SwiftUI
import SpriteKit

class ContentViewModel : ObservableObject {
    var cena : SKScene

    init() {
        self.cena = MovingNodeScene()
        cena.scaleMode = .aspectFit
    }

    func retornaCena (size : CGSize) -> SKScene {
        self.cena.size = size
        return cena
    }
}


struct ContentView: View {
    @StateObject var vm = ContentViewModel()

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                SpriteView(scene: vm.retornaCena(size: proxy.size))
            }
        }.ignoresSafeArea()
    }
}
