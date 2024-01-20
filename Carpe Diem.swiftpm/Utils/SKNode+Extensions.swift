import SpriteKit

extension SKNode {
    func isOverlapped(node: SKNode) -> Bool {
        let frameA = self.frame
        let frameB = node.frame

        let overlap = frameA.intersection(frameB)

        return overlap.size == frameA.size || overlap.size == frameB.size
    }
}
