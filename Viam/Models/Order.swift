import Foundation
import SwiftData

struct FulfillmentInfo: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    
    var method: MethodType
    var address: Address
    
    var addressString: String {
        address.fullAddress
    }
    
    var fullDescription: String {
        "\(method.title) (\(addressString))"
    }
    
    enum MethodType: Identifiable, CaseIterable, Codable, Hashable {
        var id: Self { self }
        
        case courier
        case pickup
        
        var title: String {
            switch self {
                case .courier: "Courier Delivery"
                case .pickup: "Branch Pickup"
            }
        }
    }
}

enum PaymentMethod: Identifiable, CaseIterable, Codable, Hashable {
    var id: Self { self }
    
    case card
    case cash
    
    var title: String {
        switch self {
            case .card: "Apple Pay"
            case .cash: "Cash"
        }
    }
}



struct Address: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    
    var city: String?
    var street: String?
    var houseNumber: String?
    
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
    var receivingInfo: FulfillmentInfo?
    var dropoffInfo: FulfillmentInfo?
    var paymentMethod: PaymentMethod?
    
    var isComplete: Bool {
        !items.isEmpty &&
        startDate != nil &&
        endDate != nil &&
        receivingInfo != nil &&
        dropoffInfo != nil &&
        paymentMethod != nil
    }
    
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
        receivingInfo: FulfillmentInfo? = nil,
        dropoffInfo: FulfillmentInfo? = nil,
        paymentMethod: PaymentMethod? = nil
    ) {
        self.items = items
        self.startDate = startDate
        self.endDate = endDate
        self.receivingInfo = receivingInfo
        self.dropoffInfo = dropoffInfo
        self.paymentMethod = paymentMethod
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
    
    func deleteUnavailableItems() -> [OrderItem] {
        guard let startDate, let endDate else { return [] }
            
        var updatedItems: [OrderItem] = []
        var deletedItems: [OrderItem] = []
        
        for item in items {
            let availableCount = item.product.availableCount(for: startDate...endDate)
            
            if availableCount <= 0 {
                deletedItems.append(item)
            } else if availableCount < item.quantity {
                let countToDelete = item.quantity - availableCount
                deletedItems.append(OrderItem(product: item.product, quantity: countToDelete))
                
                var updated = item
                updated.quantity = availableCount
                updatedItems.append(updated)
            } else {
                updatedItems.append(item)
            }
        }
        
        items = updatedItems
        return deletedItems
    }
    
    func changeQuantity(of product: Product, by count: Int) {
        if count > 0 {
            addProduct(product, quantity: count)
        } else if count < 0 {
            removeProduct(product, quantity: abs(count))
        }
    }
}

extension Order {
    static let mockList: [Order] = [
        Order(
            items: [
                .init(product: .mockList[0])
            ],
            startDate: Date(),
            endDate: Date().addingTimeInterval(3600),
            receivingInfo: .init(method: .pickup, address: Address(city: "Kyiv", street: "Main St 123")),
            dropoffInfo: .init(method: .pickup, address: Address(city: "Kyiv", street: "Main St 123")),
        ),
        
        Order(
            items: [
                .init(product: .mockList[0])
            ],
            startDate: Date(),
            endDate: Date().addingTimeInterval(3600),
            receivingInfo: .init(method: .pickup, address: Address(city: "Kyiv", street: "Main St 123")),
            dropoffInfo: .init(method: .pickup, address: Address(city: "Kyiv", street: "Main St 123")),
        )
    ]
}
