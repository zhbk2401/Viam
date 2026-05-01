import SwiftUI

struct PlusButton: View {
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button {
            action?()
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        } label: {
            Image(systemName: "plus")
                .bold()
                .frame(width: 36, height: 36)
                .glassEffect(.regular.interactive().tint(.accent), in: Circle())
        }
        .foregroundStyle(.black)
    }
}
