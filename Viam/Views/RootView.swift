import SwiftUI

@MainActor
struct RootView: View {
    @ObservedObject var coordinator: Coordinator
    @ObservedObject var appSettings: AppSettings

    var body: some View {
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
        .environmentObject(appSettings)
        .environmentObject(coordinator)
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
            case .prodoctCard(let product):
                Text(product.name)
            case .profile:
                Color.red
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
    RootView(coordinator: .init(), appSettings: .init())
}
