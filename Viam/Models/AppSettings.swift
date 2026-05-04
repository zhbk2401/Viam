import Foundation
import SwiftData
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
    
    @Published var currentUser: UserInfo?
    @Published var bootstrapError: String?
    
    static let shared = AppSettings()
    private var didBootstrap = false
    
    private init() {}

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
    
    func bootstrap(context: ModelContext) {
        guard !didBootstrap, bootstrapError == nil else { return }

        do {
            try ProductSeeder.seedIfNeeded(context: context)
            try loadUser(context: context)
            didBootstrap = true
        } catch {
            bootstrapError = "Failed to initialize local data: \(error.localizedDescription)"
        }
    }

    func retryBootstrap(context: ModelContext) {
        bootstrapError = nil
        bootstrap(context: context)
    }

    private func loadUser(context: ModelContext) throws {
        let descriptor = FetchDescriptor<UserInfo>()
        
        if let user = try context.fetch(descriptor).first {
            currentUser = user
        } else {
            let newUser = UserInfo()
            context.insert(newUser)
            try context.save()
            currentUser = newUser
        }
    }
}

enum AppTheme: String, CaseIterable {
    case system = "System"
    case light = "Light"
    case dark = "Dark"
}
