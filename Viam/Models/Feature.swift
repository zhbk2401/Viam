import Foundation

struct Feature: Codable, Hashable, Identifiable {
    var id: UUID
    let type: FeatureType
    let value: String
    
    init(_ type: FeatureType, value: String) {
        self.id = UUID()
        self.type = type
        self.value = value
    }
}


enum FeatureType: String, CaseIterable, Codable, Identifiable {
    var id: Self { self }
    
    // MARK: - General
    case brand, model, weight, dimensions, color, material, durability, waterproof, waterResistanceLevel, windResistance

    // MARK: - Capacity / Size
    case capacity, volume, maxLoad, size, footSize, adjustableSize

    // MARK: - Temperature / Weather
    case temperatureRating, insulation, season

    // MARK: - Power / Tech
    case powerSource, batteryLife, brightness, chargingTime

    // MARK: - Navigation / Smart
    case gps, compass, connectivity

    // MARK: - Safety
    case safetyRating, helmetCompatible

    // MARK: - Activity / Usage
    case terrain, skillLevel, activityType

    // MARK: - Clothing / Footwear
    case gender, breathability, soleType, insulationLevel

    // MARK: - Cooking
    case fuelType, cookingCapacity

    // MARK: - Extras
    case foldable, ecoFriendly

    var title: String {
        switch self {
        case .brand: "Brand"
        case .model: "Model"
        case .weight: "Weight"
        case .dimensions: "Dimensions"
        case .color: "Color"
        case .material: "Material"
        case .durability: "Durability Level"
        case .waterproof: "Waterproof"
        case .waterResistanceLevel: "Water Resistance Level"
        case .windResistance: "Wind Resistance"
        case .capacity: "Capacity"
        case .volume: "Volume"
        case .maxLoad: "Max Load"
        case .size: "Size"
        case .footSize: "Foot Size"
        case .adjustableSize: "Adjustable Size"
        case .temperatureRating: "Temperature Rating"
        case .insulation: "Insulation Type"
        case .season: "Season"
        case .powerSource: "Power Source"
        case .batteryLife: "Battery Life"
        case .brightness: "Brightness"
        case .chargingTime: "Charging Time"
        case .gps: "GPS"
        case .compass: "Compass"
        case .connectivity: "Connectivity"
        case .safetyRating: "Safety Rating"
        case .helmetCompatible: "Helmet Compatible"
        case .terrain: "Terrain"
        case .skillLevel: "Skill Level"
        case .activityType: "Activity Type"
        case .gender: "Gender"
        case .breathability: "Breathability"
        case .soleType: "Sole Type"
        case .insulationLevel: "Insulation Level"
        case .fuelType: "Fuel Type"
        case .cookingCapacity: "Cooking Capacity"
        case .foldable: "Foldable"
        case .ecoFriendly: "Eco Friendly"
        }
    }
    
    var systemIconName: String {
        switch self {
        case .brand: "tag"
        case .model: "barcode"
        case .weight: "scalemass"
        case .dimensions: "ruler"
        case .color: "paintpalette"
        case .material: "shippingbox"
        case .durability: "shield"
        case .waterproof: "drop.fill"
        case .waterResistanceLevel: "drop"
        case .windResistance: "wind"
        case .capacity: "person.3"
        case .volume: "cylinder.split.1x2"
        case .maxLoad: "arrow.down.doc"
        case .size: "tshirt"
        case .footSize: "shoe"
        case .adjustableSize: "arrow.left.and.right"
        case .temperatureRating: "thermometer.medium"
        case .insulation: "snowflake"
        case .season: "calendar"
        case .powerSource: "bolt.fill"
        case .batteryLife: "battery.100"
        case .brightness: "sun.max"
        case .chargingTime: "hourglass"
        case .gps: "location.fill"
        case .compass: "safari"
        case .connectivity: "antenna.radiowaves.left.and.right"
        case .safetyRating: "checkmark.shield"
        case .helmetCompatible: "face.smiling"
        case .terrain: "mountain.2"
        case .skillLevel: "figure.walk"
        case .activityType: "figure.climbing"
        case .gender: "person.fill.questionmark"
        case .breathability: "wind"
        case .soleType: "shoeprints.fill"
        case .insulationLevel: "thermometer.snowflake"
        case .fuelType: "fuelpump"
        case .cookingCapacity: "cookingset"
        case .foldable: "arrow.down.right.and.arrow.up.left"
        case .ecoFriendly: "leaf"
        }
    }
}
