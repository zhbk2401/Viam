import SwiftUI

struct OrderHistoryView: View {
    let orders: [Order]

    var body: some View {
        Group {
            if orders.isEmpty {
                Text("You have no past orders")
                    .font(.mulish(.medium, size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
            } else {
                List {
                    ForEach(orders.reversed()) { order in
                        InlineOrderView(order: order)
                    }
                    .listRowBackground(Rectangle().fill(.thinMaterial))
                }
            }
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Order History")
        .navigationBarTitleDisplayMode(.inline)
        .gradientBackground(tinted: true)
    }
}
