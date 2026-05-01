import SwiftUI

struct LineArrow: Shape {
    var headSize: CGFloat = 10

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let midY = rect.midY
        let start = CGPoint(x: rect.minX, y: midY)
        let end = CGPoint(x: rect.maxX, y: midY)

        path.move(to: start)
        path.addLine(to: end)

        path.move(to: CGPoint(x: end.x - headSize, y: end.y - headSize))
        path.addLine(to: end)

        path.move(to: CGPoint(x: end.x - headSize, y: end.y + headSize))
        path.addLine(to: end)

        return path
    }
}
