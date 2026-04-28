import Foundation

enum Category: CaseIterable, Codable, Hashable, Identifiable {
    var id: Self { self }
    
    case tents, sleepingBags, backpacks, clothing, footwear
    case cooking, navigation, lighting, trekking, climbing
    case waterGear, winterGear, accessories

    var title: String {
        switch self {
            case .tents: "Tents"
            case .sleepingBags: "Sleeping Bags"
            case .backpacks: "Backpacks"
            case .clothing: "Clothing"
            case .footwear: "Footwear"
            case .cooking: "Cooking Gear"
            case .navigation: "Navigation Tools"
            case .lighting: "Lighting"
            case .trekking: "Trekking Poles"
            case .climbing: "Climbing Gear"
            case .waterGear: "Water Gear"
            case .winterGear: "Winter Gear"
            case .accessories: "Accessories"
        }
    }
    
    var recommendedFeatures: [FeatureType] {
        switch self {
        case .tents:
            return [.brand, .weight, .capacity, .material, .waterproof, .windResistance, .season]
        case .sleepingBags:
            return [.brand, .weight, .temperatureRating, .insulation, .season]
        case .backpacks:
            return [.brand, .weight, .volume, .maxLoad, .material, .waterproof]
        case .clothing:
            return [.brand, .size, .gender, .material, .waterproof, .breathability, .insulationLevel]
        case .footwear:
            return [.brand, .footSize, .material, .waterproof, .terrain, .soleType]
        case .cooking:
            return [.weight, .fuelType, .cookingCapacity, .powerSource]
        case .navigation:
            return [.gps, .compass, .connectivity, .batteryLife]
        case .lighting:
            return [.brightness, .powerSource, .batteryLife, .weight]
        case .trekking:
            return [.weight, .material, .adjustableSize]
        case .climbing:
            return [.weight, .material, .safetyRating, .skillLevel]
        case .waterGear:
            return [.weight, .capacity, .material, .waterproof]
        case .winterGear:
            return [.weight, .insulation, .temperatureRating, .terrain]
        case .accessories:
            return [.weight, .material, .foldable, .ecoFriendly]
        }
    }
    
    /// Features intended for quick display as badges on the product card.
    var highlightFeatures: [FeatureType] {
        switch self {
        case .tents: [.capacity, .weight]
        case .sleepingBags: [.temperatureRating, .weight]
        case .backpacks: [.volume, .weight]
        case .clothing: [.size, .material]
        case .footwear: [.footSize, .waterproof]
        case .cooking: [.fuelType, .weight]
        case .navigation: [.gps, .batteryLife]
        case .lighting: [.brightness, .batteryLife]
        case .trekking: [.weight, .adjustableSize]
        case .climbing: [.safetyRating, .weight]
        case .waterGear: [.capacity, .waterproof]
        case .winterGear: [.temperatureRating, .insulation]
        case .accessories: [.weight, .ecoFriendly]
        }
    }
    
    var iconSystemName: String {
        switch self {
            case .tents: "tent"
            case .sleepingBags: "bed.double"
            case .backpacks: "backpack"
            case .clothing: "tshirt"
            case .footwear: "shoeprints"
            case .cooking: "flame"
            case .navigation: "location.north"
            case .lighting: "lightbulb"
            case .trekking: "figure.walk"
            case .climbing: "figure.climbing"
            case .waterGear: "drop"
            case .winterGear: "snowflake"
            case .accessories: "star"
        }
    }
}
