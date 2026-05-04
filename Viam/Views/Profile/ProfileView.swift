import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Bindable var currentUser: UserInfo
    
    var body: some View {
        List {
            Section("") {
                header
            }
            .listRowBackground(Color.clear)
            
            Section("Personal Information") {
                InfoRow("Edit Personal Info", route: .editPersonalInfo(currentUser))
            }
            
            Section("Activity") {
                InfoRow("Favorites", route: .favorites(currentUser))
                InfoRow("Order History", route: .orderHistory(currentUser.orders))
            }
            
            Section("Default Info") {
                InfoRow("Receiving") {
                    FulfillmentInfoView(info: $currentUser.defaultReceivingInfo)
                }
                
                InfoRow("Dropoff") {
                    FulfillmentInfoView(info: $currentUser.defaultDropoffInfo)
                }
                
                InfoRow("Payment") {
                    PaymentMethodField(paymentMethod: $currentUser.defaultPaymentMethod)
                }
            }
            
            Section("Danger Zone") {
                Button("Log Out", role: .destructive) {

                }
                .listRowButtonStyle()
                
                Button("Delete Account", role: .destructive) {
                    
                }
                .listRowButtonStyle()
            }
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("User Profile")
        .navigationBarTitleDisplayMode(.inline)
        .gradientBackground(tinted: true)
    }
    
    @ViewBuilder
    var header: some View {
        let image = if let avatar = currentUser.avatar {
            Image(uiImage: avatar)
        } else {
            Image(systemName: "person.crop.circle")
        }
        
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 140, height: 140)
            .clipShape(Circle())
            .conditionalModifier(currentUser.avatar == nil) { view in
                view.foregroundStyle(.secondary)
            }
            .mask {
                LinearGradient(
                    colors: [.primary, .primary, .clear],
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity)
            .overlay(alignment: .bottom) {
                Text("\(currentUser.fullName)")
                    .font(.mulish(.extraBold, size: 20))
            }
    }
}

