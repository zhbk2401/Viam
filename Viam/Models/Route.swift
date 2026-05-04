import Foundation

enum AppRoute: Hashable {
    case profile(UserInfo)
    case editPersonalInfo(UserInfo)
    case favorites(UserInfo)
    case orderHistory([Order])
    case prodoctPage(Product)
    case cart(UserInfo)
    case orderDetails(Order)
}

enum FullScreenCover: Hashable, Identifiable {
    var id: Self { self }
    
    case cover
}

enum ScreenOverlay: Hashable, Identifiable {
    var id: Self { self }
    
    case overlay
}

    
