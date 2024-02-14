import SwiftUI
import SpriteKit

class ContentViewModel : ObservableObject {
    func initialScene(screenSize: CGSize) -> SKScene {
        DataManager.instance.scaleMode = .aspectFit
        DataManager.instance.screenSize = screenSize
        
        let chest2 = Chest.build(stickerAsset: "stickerCoffee")
        let memory2 = Memory.build(nextScene: chest2, backgroundAsset: "bar", textEnum: .text2)
        let trip2 = Trip.build(nextScene: memory2, motoAsset: "moto", backgroundAsset: "city", textEnum: .text2)
        let chest1 = Chest.build(nextScene: trip2, stickerAsset: "stickerBoat", textEnum: .text1)
        let memory1 = Memory.build(nextScene: chest1, backgroundAsset: "lake", textEnum: .text1)
//        return Trip.build(nextScene: memory1, motoAsset: "moto", backgroundAsset: "mountains", textEnum: .text1)
        
        return Chest.build(nextScene: trip2, stickerAsset: "stickerBoat", textEnum: .text1)
        
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
