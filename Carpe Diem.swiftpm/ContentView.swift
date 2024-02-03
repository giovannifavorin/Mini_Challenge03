import SwiftUI
import SpriteKit

class ContentViewModel : ObservableObject {
    func initialScene(screenSize: CGSize) -> SKScene {
        DataManager.instance.scaleMode = .aspectFit
        DataManager.instance.screenSize = screenSize
        
//        let trip1 = Trip.build()
        let chest1 = Chest.build( stickerAsset: "stickerBoat")
        let memory1 = Memory.build(nextScene: chest1, backgroundAsset: "lake")
//        return Trip.build(nextScene: memory1, motoAsset: "moto", backgroundAsset: "mountains")
        return Trip.build(motoAsset: "moto", backgroundAsset: "cidade")
    }
}

struct ContentView: View {
    @StateObject var vm = ContentViewModel()

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                SpriteView(scene: vm.initialScene(screenSize: proxy.size))
            }
        }.ignoresSafeArea()
    }
}
