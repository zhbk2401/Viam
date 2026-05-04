import Foundation
import MapKit
import CoreLocation
import Combine

final class MapViewModel: NSObject, ObservableObject {
    @Published var region: MKCoordinateRegion
    @Published var searchText: String = ""
    @Published var results: [MKMapItem] = []
    @Published var selectedCoordinate: CLLocationCoordinate2D?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 49.8397, longitude: 24.0297), // Lviv
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        super.init()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func search() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = region
        
        Task {
            let response = try? await MKLocalSearch(request: request).start()
            await MainActor.run {
                self.results = response?.mapItems ?? []
            }
        }
    }
    
    func selectLocation(_ coordinate: CLLocationCoordinate2D) {
        selectedCoordinate = coordinate
    }
}

extension MapViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            if let location = manager.location {
                region.center = location.coordinate
            }
        }
    }
}
