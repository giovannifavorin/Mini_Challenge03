import SwiftUI
import SpriteKit

struct ContentView: View {
    var body: some View {
        let moto = Moto()
        let ab = Draggable(size: CGSize(width: 1920, height: 1080))
        VStack {
            SpriteView(scene: ab)
        }
    }
}
