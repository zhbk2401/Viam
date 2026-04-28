import SwiftUI
import Combine

@MainActor
final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var screenCover: FullScreenCover? = nil
    @Published var overlays: [ScreenOverlay] = []
    
    private var screenCoverStack: [FullScreenCover] = []
    
    func navigate(to route: AppRoute) {
        path.append(route)
    }

    func goBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func popToRoot() {
        path = NavigationPath()
    }

    func dismissScreenCover(_ cover: FullScreenCover) {
        screenCoverStack.removeAll(where: { $0 == cover } )
        screenCover = screenCoverStack.last
    }
    
    func dismissLastScreenCover() {
        screenCoverStack.removeLast()
        screenCover = screenCoverStack.last
    }

    func presentScreenCover(_ cover: FullScreenCover) {
        guard !screenCoverStack.contains(where: { $0 == cover }) else { return }
        screenCoverStack.append(cover)
        screenCover = screenCoverStack.last
    }
    
    func addOverlay(_ overlay: ScreenOverlay, isUnderlying: Bool = false) {
        guard !overlays.contains(overlay) else { return }
        
        if isUnderlying {
            overlays.insert(overlay, at: 0)
        } else {
            overlays.append(overlay)
        }
    }
    
    func removeOverlay(_ overlay: ScreenOverlay) {
        overlays.removeAll { $0 == overlay }
    }
}
