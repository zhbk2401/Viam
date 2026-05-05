import SwiftUI

struct CartView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Bindable var user: UserInfo
    
    var body: some View {
        OrderView(order: user.cart, isEditable: true) {
            if user.cart.isComplete {
                Button {
                    user.completeCartOrder()
                    coordinator.goBack()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        coordinator.navigate(to: .orderHistory(user.orders))
                    }
                } label: {
                    Text("Checkout")
                        .font(.mulish(.extraBold, size: 20))
                        .ignoresSafeArea()
                        .buttonSized()
                        .padding(-20)
                }
                .foregroundStyle(.black)
                .buttonStyle(.plain)
                .listRowBackground(
                    Capsule()
                        .fill(.clear)
                        .glassEffect(.regular.interactive().tint(.accent))
                )
            }
        }
        .navigationTitle("Cart")
        .animation(.bouncy, value: user.cart.isComplete)
        .onAppear {
            checkDefaultInfo()
        }
    }
    
    func checkDefaultInfo() {
        if user.cart.receivingInfo == nil {
            user.cart.receivingInfo = user.defaultReceivingInfo
        }
        
        if user.cart.dropoffInfo == nil {
            user.cart.dropoffInfo = user.defaultDropoffInfo
        }
        
        if user.cart.paymentMethod == nil {
            user.cart.paymentMethod = user.defaultPaymentMethod
        }
    }
}
