import SwiftUI

struct FulfillmentMethodView: View {
    @Binding var method: FulfillmentMethod?
    @State private var tempMethod: FulfillmentMethod?
    @State private var showPopover = false

    var placeholder: String = "Not Set"
    
    var body: some View {
        VStack(alignment: .trailing) {
            if let title = method?.title {
                Text(title)
                    .font(.mulish(.extraBold, size: 16))
            }
            
            Button {
                tempMethod = method
                showPopover = true
            } label: {
                Text(method?.addressString ?? placeholder)
            }
            .foregroundStyle(method == nil ? .secondary : .primary)
            .buttonStyle(.bordered)
            .sheet(isPresented: $showPopover) {
                methodPicker
            }
            .onChange(of: method) {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            .lineLimit(1)
            .font(.mulish(.medium, size: 16))
        }
    }
    
    var methodPicker: some View {
        NavigationView {
//            
//            .datePickerStyle(.graphical)
//            .padding()
//            .toolbar {
//                ToolbarItem(placement: .confirmationAction) {
//                    Button("", systemImage: "checkmark") {
//                        method = tempMethod
//                        showPopover = false
//                    }
//                    .buttonStyle(.borderedProminent)
//                }
//                
//                ToolbarItem(placement: .cancellationAction) {
//                    Button("", systemImage: "xmark") {
//                        showPopover = false
//                    }
//                }
//            }
        }
        .presentationDetents([.large])
    }
}


struct AddressPickerView: View {
    @Binding var address: Address
    
    var body: some View {
        
    }
}
