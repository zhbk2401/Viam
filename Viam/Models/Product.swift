import Foundation
import UIKit
import SwiftData

@Model
final class Product: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
    var info: String
    var price: Double
    var category: Category
    var features: [Feature]
    var imagesData: [Data]
    
    init(
        name: String,
        info: String = "",
        price: Double,
        category: Category,
        features: [Feature] = [],
        imagesData: [Data] = []
    ) {
        self.name = name
        self.info = info
        self.price = price
        self.category = category
        self.features = features
        self.imagesData = imagesData
    }
}

extension Product {
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
    
    static let mockList: [Product] = [
        Product(
            name: "Hiking Backpack",
            info: "Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the. Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the.",
            price: 129.99,
            category: .backpacks,
            features: [
                Feature(.capacity, value: "30"),
                Feature(.size, value: "XL"),
                Feature(.batteryLife, value: "1"),
                Feature(.brand, value: "Some Brand"),
            ],
            imagesData: [
                UIImage(resource: .backpack).pngData()!,
                UIImage(resource: .backpack).pngData()!,
                UIImage(resource: .backpack).pngData()!
            ]
        ),
        
        Product(
            name: "Trail Running Shoes",
            info: "Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the. Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the.",
            price: 89.99,
            category: .clothing,
            imagesData: [
                UIImage(resource: .roll).pngData()!,
                UIImage(resource: .roll).pngData()!,
                UIImage(resource: .roll).pngData()!
            ]
        ),
        
        Product(
            name: "Trail Running Shoes",
            info: "Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the. Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the.",
            price: 89.99,
            category: .clothing
        ),
    ]
    
}
