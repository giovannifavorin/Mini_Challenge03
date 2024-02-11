import SpriteKit

class DataManager {
    var screenSize: CGSize = .zero
    var scaleMode: SKSceneScaleMode = .aspectFill
    var stickers: [Sticker] = .init()

    static var instance = DataManager()

    private init() {}
}

enum tripText:String {
    case text1 = "Essas montanhas me lembram da viagem que fiz com meu filho, levei ele para um lago, lá nós pescamos, nos divertimos, e tivemos um ótimo momento."
    case text2 = "Continuando minha jornada, eu estou quase no fim, mas, olhando agora, eu lembro que aqui havia uma cafeteria, eu fui lá uma vez, muito tempo atrás, foi lá que eu conheci o amor da minha vida, isso foi a quantas décadas? Eu não me lembro bem…"
}

enum memoryText:String {
    case text1 = "Essa é uma ótima lembrança, nós não conversamos muito, mas apreciamos a companhia um do outro, é engraçado que nesse dia, por conta de um balanço repentino do barco, a isca acabou caindo do barco, então no fim das contas mais assistimos os peixes comerem nossas iscas do que realmente pescamos, foi divertido de toda forma."
    case text2 = "Mas eu lembro de ter visto ela, no balcão, ela parecia bem concentrada enquanto tomava o seu café, acho que se não fosse pela minha insistência, ela nunca teria me dado o número dela haha, tivemos uma longa jornada desde então, mas ainda me lembro desses momentos mágicos."
}

enum chestText:String {
    case text1 = "Eu quero guardar essa lembrança comigo, mas onde é o melhor lugar para colocá-la?"
}
