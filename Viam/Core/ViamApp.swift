import SwiftUI
import SwiftData

@main
struct ViamApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: [Product.self, UserInfo.self, Order.self, OrderItem.self])
    }
}
