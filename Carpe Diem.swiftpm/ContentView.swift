import SwiftUI
import SpriteKit

class ContentViewModel : ObservableObject {
    func initialScene(screenSize: CGSize) -> SKScene {
        DataManager.instance.scaleMode = .aspectFit
        DataManager.instance.screenSize = screenSize
        
        let chest2 = Chest.build(stickerAsset: "stickerCoffee")
        let memory2 = Memory.build(nextScene: chest2, backgroundAsset: "bar")
        let trip2 = Trip.build(nextScene: memory2, motoAsset: "moto", backgroundAsset: "city")
        let chest1 = Chest.build(nextScene: trip2, stickerAsset: "stickerBoat")
        let memory1 = Memory.build(nextScene: chest1, backgroundAsset: "lake")
        return Trip.build(nextScene: memory1, motoAsset: "moto", backgroundAsset: "mountains")
        
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
