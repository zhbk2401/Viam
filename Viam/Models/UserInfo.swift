import Foundation
import SwiftData
import UIKit

@Model
final class UserInfo {
    var name: String?
    var surname: String?
    var email: String?
    var phone: String?
    var address: Address?
    var avatarData: Data?
    var cart: Order
    var orders: [Order]
    var favoriteProductCodes: [String]
    var defaultReceivingInfo: FulfillmentInfo?
    var defaultDropoffInfo: FulfillmentInfo?
    var defaultPaymentMethod: PaymentMethod? = nil
    
    var fullName: String {
        let fullName = [name, surname].compactMap { $0 }.joined(separator: " ")
        
        return if fullName.isEmpty {
            "Brave Adventurer"
        } else {
            fullName
        }
    }
    
    init(
        name: String? = nil,
        email: String? = nil,
        phone: String? = nil,
        address: Address? = nil,
        avatarData: Data? = nil,
        cart: Order = Order(),
        orders: [Order] = [],
        favoriteProductCodes: [String] = [],
        defaultReceivingInfo: FulfillmentInfo? = nil,
        defaultDropoffInfo: FulfillmentInfo? = nil,
        defaultPaymentMethod: PaymentMethod? = nil
    ) {
        self.name = name
        self.email = email
        self.phone = phone
        self.address = address
        self.avatarData = avatarData
        self.cart = cart
        self.orders = orders
        self.favoriteProductCodes = favoriteProductCodes
        self.defaultDropoffInfo = defaultDropoffInfo
        self.defaultReceivingInfo = defaultReceivingInfo
        self.defaultPaymentMethod = defaultPaymentMethod
    }
    
    func isFavorite(_ product: Product) -> Bool {
        favoriteProductCodes.contains(where: { $0 == product.code })
    }
    
    func toggleFavoriteState(for product: Product) {
        if favoriteProductCodes.contains(product.code) {
            favoriteProductCodes.removeAll(where: { $0 == product.code })
        } else {
            favoriteProductCodes.append(product.code)
        }
    }

    func canAddToCart(_ product: Product) -> Bool {
        let currentQuantity = cart.quantityOf(product: product)

        if let startDate = cart.startDate, let endDate = cart.endDate {
            return currentQuantity < product.availableCount(for: startDate...endDate)
        }

        return currentQuantity < product.countAvailable
    }

    @discardableResult
    func addToCart(_ product: Product) -> Bool {
        guard canAddToCart(product) else { return false }
        cart.addProduct(product)
        return true
    }
    
    func removeFromCart(_ product: Product) {
        cart.items.removeAll(where: { $0.product.code == product.code } )
    }
    
    func completeCartOrder() {
        guard cart.isComplete else { return }
        
        orders.append(cart)

        guard let startDate = cart.startDate, let endDate = cart.endDate else { return }
        for item in cart.items {
            for _ in 0..<item.quantity {
                item.product.reservedDateRanges.append(startDate...endDate)
            }
        }
        
        cart = Order()
    }
}

extension UserInfo {
    var avatar: UIImage? {
        guard let data = avatarData else { return nil }
        return UIImage(data: data)
    }
}
