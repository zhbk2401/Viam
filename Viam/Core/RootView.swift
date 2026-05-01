import SwiftUI
import SwiftData

@MainActor
struct RootView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var coordinator: Coordinator = .shared
    @ObservedObject var appSettings: AppSettings = .shared
    @Query private var users: [UserInfo]
    
    var body: some View {
        Group {
            if let currentUser {
                rootContent
                    .environment(\.currentUser, currentUser)
            } else {
                ProgressView()
                    .task {
                        ensureCurrentUserExists()
                    }
            }
        }
        .environmentObject(appSettings)
        .environmentObject(coordinator)
    }
    
    private var rootContent: some View {
        ZStack {
            NavigationStack(path: $coordinator.path) {
                HomeScreenView()
                    .navigationDestination(for: AppRoute.self) { route in
                        contentFor(route: route)
                    }
            }
        }
        .fullScreenCover(item: $coordinator.screenCover, content: { cover in
            contentFor(cover: cover)
        })
        .overlay {
            ZStack {
                ForEach(coordinator.overlays) { overlay in
                    if #available(iOS 17.0, *) {
                        contentFor(overlay: overlay)
                            .transition(.opacity)
                    } else {
                        contentFor(overlay: overlay)
                    }
                }
            }
            .animation(.spring(duration: 0.4), value: coordinator.overlays)
        }
    }
    
    private var currentUser: UserInfo? {
        users.first
    }
    
    private func ensureCurrentUserExists() {
        guard users.isEmpty else { return }
        
        modelContext.insert(UserInfo())
        
        do {
            try modelContext.save()
        } catch {
            debugPrint("Error creating current user:", error)
        }
    }
    
//    func setUpOverlays() {
//        if appSettings.isStartTrialActive && !appSettings.isStartTrialPopUpShown {
//            coordinator.addOverlay(.trialInfo)
//        }
//        
//        if !appSettings.isDataGatheringShown {
//            coordinator.addOverlay(.dataGathering)
//        }
//        
//        if !appSettings.isOnboardingShown {
//            coordinator.addOverlay(.onboarding)
//        }
//    }
}

extension RootView {
    @ViewBuilder
    func contentFor(route: AppRoute) -> some View {
        switch route {
            case .prodoctPage(let product):
                ProductView(product: product)
            case .profile:
                Color.red
            case .settings:
                Color.blue
            case .saved:
                Color.green
            case .cart(let order):
                CartView(order: order)
        }
    }
    
    @ViewBuilder
    func contentFor(cover: FullScreenCover) -> some View {
        switch cover {
            case .cover: Text("Cover")
        }
    }
    
    @ViewBuilder
    func contentFor(overlay: ScreenOverlay) -> some View {
        switch overlay {
            case .overlay: Text("Overlay")
        }
    }
}

#Preview {
    RootView()
        .modelContainer(for: [Product.self, UserInfo.self, Order.self, OrderItem.self], inMemory: false)
}
