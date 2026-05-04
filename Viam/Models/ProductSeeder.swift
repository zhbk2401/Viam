import SwiftData

enum ProductSeeder {
    @MainActor
    static func seedIfNeeded(context: ModelContext) throws {
        let existingProducts = try context.fetch(FetchDescriptor<Product>())
        var existingCodes = Set(existingProducts.map(\.code))
        var inserted = false

        for product in Product.makeSeedProducts() where !existingCodes.contains(product.code) {
            context.insert(product)
            existingCodes.insert(product.code)
            inserted = true
        }

        if inserted {
            try context.save()
        }
    }
}
