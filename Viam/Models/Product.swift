import Foundation
import UIKit
import SwiftData

@Model
final class Product: Identifiable {
    var id: UUID = UUID()
    var name: String
    var info: String
    var price: Double
    var category: Category
    var features: [Feature]
    var imageData: Data?
    
    init(
        name: String,
        info: String = "",
        price: Double,
        category: Category,
        features: [Feature] = [],
        imageData: Data? = nil,
    ) {
        self.name = name
        self.info = info
        self.price = price
        self.category = category
        self.features = features
        self.imageData = imageData
    }
}

extension Product {
    var image: UIImage? {
        guard let imageData = imageData else { return nil }
        return UIImage(data: imageData)
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
}
