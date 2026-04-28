import Foundation

enum AppRoute: Hashable {
    case profile
    case prodoctCard(Product)
}

enum FullScreenCover: Hashable, Identifiable {
    var id: Self { self }
    
    case cover
}

enum ScreenOverlay: Hashable, Identifiable {
    var id: Self { self }
    
    case overlay
}
