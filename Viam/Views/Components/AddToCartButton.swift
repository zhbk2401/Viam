import SwiftUI

struct AddToCartButton: View {
    @Environment(\.currentUser) private var currentUser
    let product: Product
    var size: CGFloat = 36
    
    var body: some View {
        @Bindable var currentUser = currentUser
        
        let isInCart = currentUser.cart.items.contains(where: { $0.product.code == product.code })

        Button {
            if isInCart {
                currentUser.removeFromCart(product)
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
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
                .frame(width: size, height: size)
                .glassEffect(.regular.interactive().tint(.accent), in: Circle())
        }
        .foregroundStyle(.black)
        .animation(.bouncy, value: isInCart)
    }
}
