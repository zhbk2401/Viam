import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var vm = MapViewModel()
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: .constant(.region(vm.region))) {
                    if let coord = vm.selectedCoordinate {
                        Annotation("Selected", coordinate: coord) {
                            Image(systemName: "mappin.circle.fill")
                                .foregroundStyle(.red)
                                .font(.title)
                        }
                    }
                    
                    ForEach(vm.results, id: \.self) { item in
                        if let coord = item.placemark.location?.coordinate {
                            Marker(item.name ?? "", coordinate: coord)
                        }
                    }
                }
                .ignoresSafeArea()
//                .gesture(
//                    TapGesture()
//                        .onEnded { value in
//                            let point = value.location
//                            if let coord = proxy.convert(point, from: .local) {
//                                vm.selectLocation(coord)
//                            }
//                        }
//                )
            }
            
            VStack {
                searchBar
                searchResults
                Spacer()
            }
        }
    }
}

private extension MapView {
    var searchBar: some View {
        TextField("Search location...", text: $vm.searchText)
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .padding()
            .onSubmit {
                vm.search()
            }
    }
}

private extension MapView {
    var searchResults: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(vm.results, id: \.self) { item in
                    Button {
                        vm.selectLocation(item.location.coordinate)
                        vm.region.center = item.location.coordinate
                    } label: {
                        Text(item.name ?? "Unknown")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(.thinMaterial)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: 200)
    }
}
