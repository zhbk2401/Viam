import SwiftUI

struct PlusButton: View {
    
    var body: some View {
        Button {
            // Action to perform when the button is tapped
        } label: {
            Image(systemName: "plus")
                .bold()
                .frame(width: 36, height: 36)
                .glassEffect(.regular.interactive().tint(.accent), in: Circle())
        }
        .foregroundStyle(.black)
    }
}
