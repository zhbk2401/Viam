import Foundation

enum AppRoute: Hashable {
    case profile
    case prodoctPage(Product)
    case settings
    case saved
    case cart(Order)
}

enum FullScreenCover: Hashable, Identifiable {
    var id: Self { self }
    
    case cover
}

enum ScreenOverlay: Hashable, Identifiable {
    var id: Self { self }
    
    case overlay
}

    
