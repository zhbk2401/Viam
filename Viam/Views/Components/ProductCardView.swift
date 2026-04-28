import SwiftUI

struct ProductCardView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(product.name)
                .font(.mulish(.extraBold, size: 20))
                .lineLimit(1)
            
            PriceView(price: product.price)
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(product.info)
                        .font(.mulish(.medium, size: 14))
                        .foregroundStyle(.primary.opacity(0.7))
                    
                    features
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if let image = product.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130)
                        .clipped()
                }
            }
        }
        .frame(maxHeight: 210, alignment: .leading)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 30)
                .fill(.thinMaterial)
                
        }
        .overlay(alignment: .topTrailing) {
            PlusButton()
                .padding()
        }
    }
    
    var features: some View {
        HStack(spacing: 5) {
            ForEach(product.orderedFeatuers.prefix(2)) { feature in
                FeatureBadge(feature: feature)
            }
        }
    }
}
