import SwiftUI
import SwiftData

@main
struct ViamApp: App {
    let coordinator = Coordinator()
    let appSettings = AppSettings()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Product.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RootView(coordinator: coordinator, appSettings: appSettings)
        }
        .modelContainer(sharedModelContainer)
    }
}
