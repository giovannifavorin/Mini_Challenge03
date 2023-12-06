import SwiftUI
import SpriteKit


import SpriteKit

class ContentViewModel : ObservableObject{
    var cena : SKScene

    init() {
        self.cena = Draggable()
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
/*
struct ContentView: View {
    var body: some View {
//        let moto = Moto()
        let ab = Draggable(size: CGSize(width: self.size.width, height: 2732))
        VStack {
            SpriteView(scene: ab)
        }
    }
}
*/
