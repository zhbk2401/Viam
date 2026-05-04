import Foundation

final class BranchDatabase {
    
    static let branches: [Address] = [
        // Lviv
        .init(city: "Lviv", street: "Horodotska Street", houseNumber: "7"),
        .init(city: "Lviv", street: "Shevchenka Avenue", houseNumber: "24"),
        .init(city: "Lviv", street: "Chornovola Avenue", houseNumber: "45"),

        // Ivano-Frankivsk
        .init(city: "Ivano-Frankivsk", street: "Nezalezhnosti Street", houseNumber: "34"),
        .init(city: "Ivano-Frankivsk", street: "Halytska Street", houseNumber: "67"),
        .init(city: "Ivano-Frankivsk", street: "Mazepy Street", houseNumber: "12"),

        // Lutsk
        .init(city: "Lutsk", street: "Voli Avenue", houseNumber: "15"),
        .init(city: "Lutsk", street: "Lesi Ukrainky Street", houseNumber: "28"),
        .init(city: "Lutsk", street: "Kovelska Street", houseNumber: "52"),
    ]
    
    static var cities: [String] {
        Set(branches.compactMap { $0.city }).sorted()
    }
    
    static func filterBranches(in city: String) -> [Address] {
        let filtered = branches.filter { $0.city?.lowercased() == city.lowercased() }
        
        for branch in filtered {
            print("Branch: \(branch.fullAddress)")
        }
        
        return filtered
    }
}

