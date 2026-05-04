import SwiftData
import Foundation

enum ProductSeeder {
    /// Виконує сідинг у фоновому потоці, щоб не блокувати UI
    static func seedIfNeeded(container: ModelContainer) async throws {
        // Створюємо фоновий контекст
        let context = ModelContext(container)
        context.autosaveEnabled = false
        
        let descriptor = FetchDescriptor<Product>()
        let existingProducts = try context.fetch(descriptor)
        let existingCodes = Set(existingProducts.map(\.code))
        
        // Отримуємо шаблони
        let templates = Product.generatedSeedTemplates
        var insertedCount = 0
        
        for template in templates {
            if !existingCodes.contains(template.code) {
                let product = Product(
                    code: template.code,
                    name: template.name,
                    info: template.info,
                    price: template.price,
                    category: template.category,
                    features: template.features,
                    imagesData: template.imagesData,
                    countAvailable: template.countAvailable
                )
                context.insert(product)
                insertedCount += 1
                
                // Зберігаємо частинами, щоб не перевантажувати пам'ять
                if insertedCount % 5 == 0 {
                    try context.save()
                }
            }
        }
        
        if insertedCount > 0 {
            try context.save()
            print("Successfully seeded \(insertedCount) products.")
        }
    }
}
