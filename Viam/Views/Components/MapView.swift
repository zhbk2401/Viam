import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var vm = MapViewModel()
    var onSelectMapItem: ((MKMapItem) -> Void)? = nil
    
    var body: some View {
        ZStack {
            MapReader { _ in
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
                .onTapGesture {
                    hideKeyboard()
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
            .multilineTextAlignment(.leading)
            .glassEffect(.regular.interactive())
            .padding()
            .onChange(of: vm.searchText) {
                vm.search()
            }
    }
}

private extension MapView {
    var searchResults: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(vm.results, id: \.self) { item in
                    Button {
                        hideKeyboard()
                        guard let coordinate = item.placemark.location?.coordinate else {
                            onSelectMapItem?(item)
                            return
                        }
                        vm.selectLocation(coordinate)
                        vm.region.center = coordinate
                        onSelectMapItem?(item)
                    } label: {
                        Text(item.name ?? "Unknown")
                            .font(.mulish(.extraBold, size: 16))
                            .contentShape(Rectangle())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                    }
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.regularMaterial)
                    .glassEffect(
                        .regular.interactive(),
                        in: RoundedRectangle(cornerRadius: 20)
                    )
            }
        }
        .frame(maxHeight: vm.results.isEmpty ? 0 : 300)
        .animation(.bouncy, value: vm.results)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
    }
}
