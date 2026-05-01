import Foundation
import SwiftData
import UIKit

@Model
final class UserInfo {
    var name: String?
    var email: String?
    var phone: String?
    var address: Address?
    var avatarData: Data?
    var cart: Order
    var orders: [Order]
    
    init(
        name: String? = nil,
        email: String? = nil,
        phone: String? = nil,
        address: Address? = nil,
        avatarData: Data? = nil,
        cart: Order = Order(),
        orders: [Order] = []
    ) {
        self.name = name
        self.email = email
        self.phone = phone
        self.address = address
        self.avatarData = avatarData
        self.cart = cart
        self.orders = orders
    }
}

extension UserInfo {
    var avatar: UIImage? {
        guard let data = avatarData else { return nil }
        return UIImage(data: data)
    }
}
