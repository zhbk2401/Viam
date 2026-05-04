import SwiftUI

struct CartView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Bindable var user: UserInfo
    
    var body: some View {
        OrderView(order: user.cart, isEditable: true)
            .navigationTitle("Cart")
            .toolbar {
                if user.cart.isComplete {
                    Button("Confirm") {
                        user.completeCartOrder()
                        coordinator.goBack()
                        coordinator.navigate(to: .orderHistory(user.orders))
                        
                        guard let order = user.orders.last else { return }
                        coordinator.navigate(to: .orderDetails(order))
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.accent)
                }
            }
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
