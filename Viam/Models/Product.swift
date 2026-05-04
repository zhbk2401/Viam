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
    @Attribute(.externalStorage) var imagesData: [Data]
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
        let imageResourceNames: [String]
        let countAvailable: Int
    }

    static let seedTemplates: [SeedTemplate] = []

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
}
