import SwiftData
import Foundation
import UIKit

enum ProductSeeder {
    /// Виконує сідинг у фоновому потоці, якщо база порожня
    static func seedIfNeeded(container: ModelContainer) async throws {
        // Створюємо фоновий контекст
        let context = ModelContext(container)
        context.autosaveEnabled = false
        
        // 1. Швидка перевірка кількості
        let descriptor = FetchDescriptor<Product>()
        let count = (try? context.fetchCount(descriptor)) ?? 0
        
        if count > 0 {
            print("Database already has \(count) products. Skipping seed.")
            return
        }
        
        print("Database is empty. Starting seed process...")
        
        // 2. Отримуємо шаблони
        let templates = Product.seedTemplates + Product.generatedSeedTemplates
        var insertedCount = 0
        
        for template in templates {
            // Завантажуємо фото безпечно
            var imagesData: [Data] = []
            for name in template.imageResourceNames {
                // Спробуємо завантажити як іменований асет
                if let data = UIImage(named: name)?.pngData() {
                    imagesData.append(data)
                }
            }
            
            let product = Product(
                code: template.code,
                name: template.name,
                info: template.info,
                price: template.price,
                category: template.category,
                features: template.features,
                imagesData: imagesData,
                countAvailable: template.countAvailable
            )
            
            context.insert(product)
            insertedCount += 1
            
            // Зберігаємо порціями, щоб не перевантажувати RAM
            if insertedCount % 10 == 0 {
                try? context.save()
            }
        }
        
        try? context.save()
        print("Successfully seeded \(insertedCount) products.")
    }
}
