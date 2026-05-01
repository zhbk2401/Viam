import Foundation
import SwiftData

enum FulfillmentMethod: Identifiable, Codable, Hashable {
    var id: Self { self }
    
    case courier(Address)
    case pickup(Address)
    
    var title: String {
        switch self {
            case .courier: "Courier Delivery"
            case .pickup: "Pickup Point"
        }
    }
    
    var addressString: String {
        switch self {
            case .courier(let address): address.fullAddress
            case .pickup(let address): address.fullAddress
        }
    }
    
    var fullDescription: String {
        "\(title) (\(addressString))"
    }
}

struct Address: Identifiable, Codable, Hashable {
    var id: Self { self }
    
    let city: String?
    let street: String?
    let houseNumber: String?
    
    var fullAddress: String {
        [streetWithNumber, city]
            .compactMap { $0 }
            .joined(separator: ", ")
    }
    
    var streetWithNumber: String? {
        if let street, let houseNumber {
            return "\(street) \(houseNumber)"
        }
        return street
    }
    
    init(
        city: String? = nil,
        street: String? = nil,
        houseNumber: String? = nil,
    ) {
        self.city = city
        self.street = street
        self.houseNumber = houseNumber
    }
}

@Model
final class Order: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    @Relationship(deleteRule: .cascade, inverse: \OrderItem.order)
    var items: [OrderItem]
    var startDate: Date?
    var endDate: Date?
    var receivingMethod: FulfillmentMethod?
    var dropoffMethod: FulfillmentMethod?
    
    var daysDuration: Int? {
        guard let startDate, let endDate else { return nil }
        let calendar = Calendar.current
        
        let start = calendar.startOfDay(for: startDate)
        let end = calendar.startOfDay(for: endDate)
        let days = calendar.dateComponents([.day], from: start, to: end).day ?? 0
        
        return days + 1
    }
    
    var itemCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
    
    var totalPricePerDay: Double {
        items.reduce(0) { $0 + $1.subtotalPrice }
    }
    
    var totalPrice: Double {
        if let days = daysDuration {
            return totalPricePerDay * Double(days)
        } else {
            return totalPricePerDay
        }
    }
    
    init(
        items: [OrderItem] = [],
        startDate: Date? = nil,
        endDate: Date? = nil,
        receivingMethod: FulfillmentMethod? = nil,
        dropoffMethod: FulfillmentMethod? = nil
    ) {
        self.items = items
        self.startDate = startDate
        self.endDate = endDate
        self.receivingMethod = receivingMethod
        self.dropoffMethod = dropoffMethod
    }
    
    var nonEmptyItems: [OrderItem] {
        items.filter { $0.quantity > 0 }
    }
    
    func item(for product: Product) -> OrderItem? {
        items.first { $0.product.id == product.id }
    }
    
    func quantityOf(product: Product) -> Int {
        item(for: product)?.quantity ?? 0
    }
    
    func addProduct(_ product: Product, quantity: Int = 1) {
        guard quantity > 0 else { return }
        
        if let existingItem = item(for: product) {
            existingItem.quantity += quantity
            return
        }
        
        items.append(OrderItem(product: product, quantity: quantity, order: self))
    }
    
    func removeProduct(_ product: Product, quantity: Int = 1) {
        guard quantity > 0 else { return }
        guard let existingItem = item(for: product) else { return }
        
        let remainingQuantity = existingItem.quantity - quantity
        if remainingQuantity > 0 {
            existingItem.quantity = remainingQuantity
            return
        }
        
        items.removeAll { $0.id == existingItem.id }
    }
    
    func removeItem(for product: Product) {
        items.removeAll { $0.product.id == product.id }
    }
    
    func changeQuantity(of product: Product, by count: Int) {
        if count > 0 {
            addProduct(product, quantity: count)
        } else if count < 0 {
            removeProduct(product, quantity: abs(count))
        }
    }
}
