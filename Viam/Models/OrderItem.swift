import Foundation
import SwiftData

@Model
final class OrderItem: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var product: Product
    var quantity: Int
    var order: Order?
    
    var subtotalPrice: Double {
        product.price * Double(quantity)
    }
    
    init(product: Product, quantity: Int = 1, order: Order? = nil) {
        self.product = product
        self.quantity = max(1, quantity)
        self.order = order
    }
}

extension [OrderItem] {
    func toString(separator: String = ", ") -> String {
        self.map { "\($0.product.name) x\($0.quantity)" }.joined(separator: separator)
    }
}
