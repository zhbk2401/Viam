import SwiftUI

struct CartView: View {
    var order: Order
    
    var body: some View {
        OrderView(order: order, isEditable: true)
            .navigationTitle("Cart")
            .gradientBackground(tinted: true)
    }
}
