import SwiftUI

struct FeatureBadge: View {
    let feature: Feature
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: feature.type.systemIconName)
                .font(.mulish(.bold, size: 14))
            
            Group {
                Text(feature.value)

                if let unit = feature.type.unit {
                    Text(unit)
                }
            }
            .lineLimit(1)
            .font(.mulish(.bold, size: 14))
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 8)
        .background {
            Capsule()
                .fill(.ultraThickMaterial)
                .shadow(color: .black.opacity(0.1), radius: 5)
        }
    }
}
