import SwiftUI

struct ProductCardView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Environment(\.currentUser) private var currentUser
    let product: Product
    
    var body: some View {
        @Bindable var currentUser = currentUser
        
        VStack(alignment: .leading, spacing: 5) {
            Text(product.name)
                .font(.mulish(.extraBold, size: 20))
                .lineLimit(1)
                .padding(.trailing, 40)
            
            PriceView(price: product.price)
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(product.info)
                        .font(.mulish(.medium, size: 13))
                        .foregroundStyle(.primary.opacity(0.7))
                    
                    features
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if let image = product.images.first {
                    
                    let aspectRatio = image.size.width / image.size.height
                    
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical, -20)
                        .offset(y: aspectRatio < 1 ? 15 : 0)
                        .scaleEffect(aspectRatio < 1 ? 1.1 : 1)
                        .frame(width: 140)
                }
            }
        }
        .frame(maxHeight: 200, alignment: .leading)
        .padding()
        .tileBackground()
        .overlay(alignment: .topTrailing) {
            AddToCartButton(product: product)
                .padding()
        }
        .clipped()
        .onTapGesture {
            coordinator.navigate(to: .prodoctPage(product))
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

struct InlineProductCard: View {
    @EnvironmentObject var coordinator: Coordinator
    let product: Product
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name)
                    .font(.mulish(.extraBold, size: 20))
                    .lineLimit(1)
                
                PriceView(price: product.price)
                
                Text(product.info)
                    .font(.mulish(.medium, size: 13))
                    .foregroundStyle(.primary.opacity(0.7))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if let image = product.images.first {
                
                let aspectRatio = image.size.width / image.size.height
                
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical, aspectRatio < 1 ? -20 : 0)
                    .offset(y: aspectRatio < 1 ? 15 : 0)
                    .scaleEffect(aspectRatio < 1 ? 1.1 : 1)
                    .frame(width: 100)
            }
        }
        .frame(maxHeight: 100, alignment: .leading)
        .onTapGesture {
            coordinator.navigate(to: .prodoctPage(product))
        }
    }
}

struct CompactProductCardView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Environment(\.currentUser) private var currentUser
    let product: Product
    
    var body: some View {
        @Bindable var currentUser = currentUser
        
        ZStack {
            Image(uiImage: product.images.first ?? UIImage())
                .resizable()
                .scaledToFit()
                .offset(y: -15)
                
            RoundedRectangle(cornerRadius: 30)
                .fill(.thinMaterial)
                .mask {
                    LinearGradient(
                        colors: [.clear, .clear, .primary.opacity(0.8), .primary],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                }
            
            Text(product.name)
                .lineLimit(2)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .font(.mulish(.extraBold, size: 16))
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
        }
        .frame(width: 150, height: 150)
        .tileBackground()
        .onTapGesture {
            coordinator.navigate(to: .prodoctPage(product))
        }
    }
}
