import SwiftUI

struct CategoryView: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .font(.mulish(.medium, size: 16))
            .foregroundStyle(isSelected ? .white : .primary.opacity(0.7))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .glassEffect(
                .regular.interactive().tint(isSelected ? .secondaryAccent : .clear),
                in: Capsule()
            )
    }
}
