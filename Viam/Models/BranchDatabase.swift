import Foundation

final class BranchDatabase {
    
    static let branches: [Address] = [
        .init(city: "Lviv", street: "Lviv Street One", houseNumber: "1"),
        .init(city: "Lviv", street: "Lviv Street Two", houseNumber: "2"),
        .init(city: "Lviv", street: "Lviv Street Three", houseNumber: "3"),
        .init(city: "Ivano-Frankivsk", street: "IF Street One", houseNumber: "1"),
        .init(city: "Ivano-Frankivsk", street: "IF Street Two", houseNumber: "2"),
        .init(city: "Ivano-Frankivsk", street: "IF Street Three", houseNumber: "3"),
        .init(city: "Lutsk", street: "Lutsk Street One", houseNumber: "1"),
        .init(city: "Lutsk", street: "Lutsk Street Two", houseNumber: "2"),
        .init(city: "Lutsk", street: "Lutsk Street Three", houseNumber: "3"),
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

