import Foundation
import UIKit
import SwiftData

@Model
final class Product: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    @Attribute(.unique) var code: String
    var name: String
    var info: String
    var price: Double
    var category: Category
    var features: [Feature]
    var imagesData: [Data]
    var countAvailable: Int
    var reservedDateRanges: [ClosedRange<Date>]
    
    init(
        id: UUID = UUID(),
        code: String = UUID().uuidString,
        name: String,
        info: String = "",
        price: Double,
        category: Category,
        features: [Feature] = [],
        imagesData: [Data] = [],
        reservedDateRanges: [ClosedRange<Date>] = [],
        countAvailable: Int = 1
    ) {
        self.id = id
        self.code = code
        self.name = name
        self.info = info
        self.price = price
        self.category = category
        self.features = features
        self.imagesData = imagesData
        self.reservedDateRanges = reservedDateRanges
        self.countAvailable = countAvailable
    }
    
    func availableCount(for range: ClosedRange<Date>) -> Int {
        let overlappingReservations = reservedDateRanges.filter { $0.overlaps(range) }
        return max(0, countAvailable - overlappingReservations.count)
    }
}

extension Product {
    struct SeedTemplate {
        let code: String
        let name: String
        let info: String
        let price: Double
        let category: Category
        let features: [Feature]
        let imagesData: [Data]
        let countAvailable: Int
    }

    static let seedTemplates: [SeedTemplate] = [
        SeedTemplate(
            code: "hiking-backpack-30l",
            name: "Hiking Backpack",
            info: "Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the. Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the.",
            price: 129.99,
            category: .backpacks,
            features: [
                Feature(.capacity, value: "30"),
                Feature(.size, value: "XL"),
                Feature(.batteryLife, value: "1"),
                Feature(.brand, value: "Some Brand")
            ],
            imagesData: [
                UIImage(resource: .backpack).pngData()!,
                UIImage(resource: .backpack).pngData()!,
                UIImage(resource: .backpack).pngData()!
            ],
            countAvailable: 4
        ),

        SeedTemplate(
            code: "trail-running-shoes",
            name: "Trail Running Shoes",
            info: "Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the. Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the.",
            price: 89.99,
            category: .clothing,
            features: [],
            imagesData: [
                UIImage(resource: .roll).pngData()!,
                UIImage(resource: .roll).pngData()!,
                UIImage(resource: .roll).pngData()!
            ],
            countAvailable: 6
        ),

        SeedTemplate(
            code: "trail-running-shoes-light",
            name: "Trail Running Shoes",
            info: "Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the. Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the.",
            price: 89.99,
            category: .clothing,
            features: [],
            imagesData: [],
            countAvailable: 3
        )
    ]

    static func makeSeedProducts() -> [Product] {
        seedTemplates.map { template in
            Product(
                code: template.code,
                name: template.name,
                info: template.info,
                price: template.price,
                category: template.category,
                features: template.features,
                imagesData: template.imagesData,
                reservedDateRanges: [],
                countAvailable: template.countAvailable
            )
        }
    }

    var images: [UIImage] {
        imagesData.compactMap { UIImage(data: $0) }
    }
    
    var orderedFeatuers: [Feature] {
        let orderIndex = Dictionary(
            uniqueKeysWithValues: category.highlightFeatures.enumerated().map { ($1, $0) }
        )

        let ordered = features.sorted {
            (orderIndex[$0.type] ?? Int.max) < (orderIndex[$1.type] ?? Int.max)
        }
        
        return ordered
    }
    
    static var mockList: [Product] {
        makeSeedProducts()
    }
}
