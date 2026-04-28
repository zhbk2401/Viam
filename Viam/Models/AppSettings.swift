import Foundation
import Combine
import SwiftUI

final class AppSettings: ObservableObject {
    @AppStorage("isOnboardingShown") var isOnboardingShown = false
    @AppStorage("isSignedIn") var isSignedIn = false
    @AppStorage("preferredTheme") var preferredTheme: AppTheme = .system {
        didSet {
            objectWillChange.send()
        }
    }

    func applyTheme(_ theme: AppTheme) {
        preferredTheme = theme
    }

    func getColorScheme() -> ColorScheme? {
        switch preferredTheme {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return nil
        }
    }
}

enum AppTheme: String, CaseIterable {
    case system = "System"
    case light = "Light"
    case dark = "Dark"
}

