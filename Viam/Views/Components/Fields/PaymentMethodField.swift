import SwiftUI

struct PaymentMethodField: View {
    @Binding var paymentMethod: PaymentMethod?
    var placeholder: String = "Not Set"
    
    var body: some View {
        Menu {
            ForEach(PaymentMethod.allCases) { method in
                Button(method.title) {
                    paymentMethod = method
                }
            }
        } label: {
            HStack {
                Text(paymentMethod?.title ?? "Not Set")
                    .foregroundStyle(paymentMethod == nil ? .secondary : .primary)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity ,alignment: .trailing)
        }
        .onChange(of: paymentMethod) {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        }
        .lineLimit(1)
        .font(.mulish(.medium, size: 16))
    }
}
