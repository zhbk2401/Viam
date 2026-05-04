import SwiftUI
import MapKit

struct FulfillmentInfoView: View {
    @Binding var info: FulfillmentInfo?
    @State private var tempInfo = FulfillmentInfo(method: .courier, address: Address())
    @State private var showPopover = false

    var placeholder: String = "Not Set"
    
    var body: some View {
        VStack(alignment: .trailing) {
            if let title = info?.method.title {
                Text(title)
                    .font(.mulish(.extraBold, size: 16))
            }
            
            Button {
                tempInfo = info ?? .init(method: .courier, address: Address())
                showPopover = true
            } label: {
                Text(info?.addressString ?? placeholder)
            }
            .foregroundStyle(info == nil ? .secondary : .primary)
            .buttonStyle(.bordered)
            .sheet(isPresented: $showPopover) {
                methodPicker
            }
            .onChange(of: info) {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            .lineLimit(1)
            .font(.mulish(.medium, size: 16))
        }
    }
    
    var methodPicker: some View {
        NavigationView {
            FulfillmentInfoPickerView(info: $tempInfo)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("", systemImage: "checkmark") {
                            info = tempInfo
                            showPopover = false
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                    ToolbarItem(placement: .cancellationAction) {
                        Button("", systemImage: "xmark") {
                            showPopover = false
                        }
                    }
                }
        }
        .presentationBackground(.ultraThickMaterial)
        .presentationDetents([.large])
    }
}


struct FulfillmentInfoPickerView: View {
    @Binding var info: FulfillmentInfo
    
    @State var showMap: Bool = false
    @State private var courierCity = ""
    @State private var courierStreet = ""
    @State private var courierHouseNumber = ""
    
    var filteredBranches: [Address] {
        BranchDatabase.filterBranches(in: info.address.city ?? "")
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Picker("", selection: $info.method) {
                ForEach(FulfillmentInfo.MethodType.allCases) { method in
                    Text(method.title).tag(method)
                }
            }
            .onChange(of: info.method) { oldValue, newValue in
                if newValue != oldValue {
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    info.address = Address()
                    syncCourierInputsFromAddress()
                }
            }
            .pickerStyle(.segmented)
            
            Group {
                if info.method == .pickup {
                    pickupInfo
                } else {
                    deliveryInfo
                }
            }

            Spacer(minLength: 0)
            
            if info.method == .courier {
                Button {
                    showMap = true
                } label: {
                    Label("Select on Map", systemImage: "map")
                        .foregroundStyle(.white)
                        .buttonSized()
                }
                .buttonStyle(.plain)
                .glassEffect(.regular.interactive().tint(.secondaryAccent))
            }
        }
        .animation(.bouncy, value: info.method)
        .padding()
        .dismissKeyboardOnTap()
        .sheet(isPresented: $showMap) {
            NavigationView {
                MapView(
                    onSelectMapItem: info.method == .courier ? { mapItem in
                        applyMapItem(mapItem)
                        showMap = false
                    } : nil
                )
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("", systemImage: "checkmark") {
                                showMap = false
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        
                        ToolbarItem(placement: .cancellationAction) {
                            Button("", systemImage: "xmark") {
                                showMap = false
                            }
                        }
                    }
            }
            .presentationDetents([.large])
        }
        .onAppear {
            syncCourierInputsFromAddress()
        }
    }
    
    @ViewBuilder
    var deliveryInfo: some View {
        InputField("City") {
            TextField("City", text: $courierCity)
                .textFieldStyle(.plain)
                .textInputAutocapitalization(.words)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .onChange(of: courierCity) { _, _ in
                    updateAddressFromCourierInputs()
                }
        }
        
        InputField("Street") {
            TextField("Street", text: $courierStreet)
                .textFieldStyle(.plain)
                .textInputAutocapitalization(.words)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .onChange(of: courierStreet) { _, _ in
                    updateAddressFromCourierInputs()
                }
        }
        
        InputField("House Number") {
            TextField("House Number", text: $courierHouseNumber)
                .textFieldStyle(.plain)
                .textInputAutocapitalization(.never)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .onChange(of: courierHouseNumber) { _, _ in
                    updateAddressFromCourierInputs()
                }
        }
    }
    
    @ViewBuilder
    var pickupInfo: some View {
        InputField("City") {
            Menu {
                ForEach(BranchDatabase.cities, id: \.self) { city in
                    Button(action: {
                        if city != info.address.city {
                            info.address.city = city
                            info.address.street = nil
                            info.address.houseNumber = nil
                        }
                    }) {
                        Text(city)
                    }
                }
            } label: {
                HStack {
                    Text(info.address.city ?? "Not specified")
                        .foregroundColor((info.address.city ?? "").isEmpty ? .secondary : .primary)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }
                .contentShape(Rectangle())
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .buttonStyle(.plain)
        }
        
        InputField("Branch") {
            Menu {
                ForEach(filteredBranches) { branchAddress in
                    Button(action: {
                        info.address.street = branchAddress.street
                        info.address.houseNumber = branchAddress.houseNumber
                    }) {
                        Text(branchAddress.streetWithNumber ?? "Unknown")
                    }
                }
            } label: {
                HStack {
                    Text(info.address.streetWithNumber ?? "Not specified")
                        .foregroundColor((info.address.streetWithNumber ?? "").isEmpty ? .secondary : .primary)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }
                .contentShape(Rectangle())
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .disabled(filteredBranches.isEmpty)
            .buttonStyle(.plain)
        }
    }

    private func updateAddressFromCourierInputs() {
        info.address.city = normalized(courierCity)
        info.address.street = normalized(courierStreet)
        info.address.houseNumber = normalized(courierHouseNumber)
    }

    private func syncCourierInputsFromAddress() {
        courierCity = info.address.city ?? ""
        courierStreet = info.address.street ?? ""
        courierHouseNumber = info.address.houseNumber ?? ""
    }

    private func applyMapItem(_ item: MKMapItem) {
        let placemark = item.placemark

        info.address.city = placemark.locality
            ?? placemark.subAdministrativeArea
            ?? placemark.administrativeArea
            ?? info.address.city
        info.address.street = placemark.thoroughfare
            ?? placemark.name
            ?? placemark.title
            ?? item.name
        info.address.houseNumber = placemark.subThoroughfare

        syncCourierInputsFromAddress()
    }

    private func normalized(_ value: String) -> String? {
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? nil : trimmed
    }
}
