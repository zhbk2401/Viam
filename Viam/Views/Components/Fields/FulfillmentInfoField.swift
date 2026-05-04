import SwiftUI

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
                }
            }
            .pickerStyle(.segmented)
            
            if info.method == .pickup {
                pickupInfo
            } else {
                deliveryInfo
            }
        }
        .padding()
        .sheet(isPresented: $showMap) {
            NavigationView {
                MapView()
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("", systemImage: "checkmark") {
//                                info = tempInfo
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
    }
    
    @ViewBuilder
    var deliveryInfo: some View {
        
    }
    
    @ViewBuilder
    var pickupInfo: some View {
        section("City") {
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
        
        section("Branch") {
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
    
    @ViewBuilder
    func section<V: View>(
        _ title: String,
        @ViewBuilder content: () -> V
    ) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.mulish(.medium, size: 14))
                .padding(.horizontal, 15)
            
            content()
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.ultraThinMaterial)
                }
        }
    }
}
