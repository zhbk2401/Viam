import SwiftUI
import SwiftData
import Combine

@MainActor
struct RootView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject var coordinator: Coordinator = .shared
    @StateObject var appSettings: AppSettings = .shared
    
    var body: some View {
        Group {
            if let user = appSettings.currentUser {
                rootContent
                    .environment(\.currentUser, user)
            } else if let error = appSettings.bootstrapError {
                ContentUnavailableView(
                    "Initialization Error",
                    systemImage: "exclamationmark.triangle",
                    description: Text(error)
                )
                .overlay(alignment: .bottom) {
                    Button("Retry") {
                        appSettings.retryBootstrap(container: modelContext.container)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            } else {
                ProgressView()
                    .task {
                        appSettings.bootstrap(container: modelContext.container)
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
            case .cart(let userInfo):
                CartView(user: userInfo)
            case .profile(let userInfo):
                ProfileView(currentUser: userInfo)
            case .editPersonalInfo(let userInfo):
                PersonalInfoEditingView(user: userInfo)
            case .favorites(let userInfo):
                FavoritesView(user: userInfo)
            case .orderHistory(let orders):
                OrderHistoryView(orders: orders)
            case .orderDetails(let order):
                OrderView(order: order, isEditable: false)
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
        .modelContainer(for: [Product.self, UserInfo.self, Order.self, OrderItem.self], inMemory: true)
}
