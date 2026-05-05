import SwiftUI

struct AddToCartButton: View {
    @Environment(\.currentUser) private var currentUser
    let product: Product
    
    var body: some View {
        @Bindable var currentUser = currentUser
        
        let isInCart = currentUser.cart.items.contains(where: { $0.product.code == product.code })

        Button {
            if isInCart {
                currentUser.removeFromCart(product)
            } else {
                if currentUser.addToCart(product) {
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                } else {
                    UINotificationFeedbackGenerator().notificationOccurred(.warning)
                }
            }
        } label: {
            Image(systemName: isInCart ? "checkmark" : "plus")
                .bold()
                .frame(width: 36, height: 36)
                .glassEffect(.regular.interactive().tint(.accent), in: Circle())
        }
        .foregroundStyle(.black)
        .animation(.bouncy, value: isInCart)
    }
}
