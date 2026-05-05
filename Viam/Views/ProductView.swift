import SwiftUI

struct ProductView: View {
    @Environment(\.currentUser) private var currentUser
    @State var showActionSheet = false
    @State var showFullInfo = false
    
    let product: Product
    
    var body: some View {
        @Bindable var currentUser = currentUser
        
        ScrollView {
            VStack(spacing: 10) {
                CarouselView(items: product.images) { image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(height: 240)
                
                header
                info
                features
                
                compactProductViewRow(title: "Often taken with", products: [product, product])
                compactProductViewRow(title: "Similar products", products: [product, product])
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .gradientBackground()
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    showActionSheet = true
                } label: {
                    Image(systemName: "ellipsis")
                }
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(title: Text("Details"), buttons: [
                        .default(Text("Share")) {},
                        .default(Text("Copy Link")) {},
                        .destructive(Text("Report")) {},
                    ])
                }
            }
            
            ToolbarItemGroup(placement: .bottomBar) {
                
                let isAddedToCart = currentUser.cart.items.contains(where: { $0.product.code == product.code })
                
                Button {
                    if isAddedToCart {
                        currentUser.removeFromCart(product)
                    } else {
                        if currentUser.addToCart(product) {
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        } else {
                            UINotificationFeedbackGenerator().notificationOccurred(.warning)
                        }
                    }
                } label: {
                    let buttonText = isAddedToCart
                        ? "Remove from Cart"
                        : "Add to Cart"
                    
                    Text(buttonText)
                        .font(.mulish(.extraBold, size: 20))
                        .foregroundStyle(.black)
                }
                .buttonStyle(.borderedProminent)
                .tint(.accent)
                
                Spacer()
                
                Button {
                    currentUser.toggleFavoriteState(for: product)
                } label: {
                    Image(systemName: currentUser.isFavorite(product) ? "heart.fill" : "heart")
                        .font(.mulish(.extraBold, size: 20))
                        .foregroundStyle(.white)
                }
                .buttonStyle(.borderedProminent)
                .tint(.secondaryAccent)
            }
        }
    }
    
    var header: some View {
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.mulish(.extraBold, size: 30))
            
            PriceView(price: product.price)
                .foregroundStyle(.secondary)
            
            if let startDate = currentUser.cart.startDate,
               let endDate = currentUser.cart.endDate {
                Text("Available count: \(product.availableCount(for: startDate...endDate))")
                    .font(.mulish(.medium, size: 14))
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var info: some View {
        Text(product.info)
            .font(.mulish(.medium, size: 16))
            .lineLimit(showFullInfo ? nil : 5)
            .mask {
                LinearGradient(
                    colors: [.primary, .primary, .primary.opacity(showFullInfo ? 1 : 0)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
            .padding(.bottom, 30)
            .overlay(alignment: .bottom) {
                Button {
                    withAnimation(.bouncy) {
                        showFullInfo.toggle()
                    }
                } label: {
                    Label(
                        showFullInfo ? "Read Less" : "Read More",
                        systemImage: showFullInfo ? "chevron.up" : "chevron.down"
                    )
                    .font(.mulish(.extraBold, size: 16))
                    .foregroundStyle(.black.opacity(0.8))
                    .padding(5)
                }
            }
    }
    
    var features: some View {
        let spacing: CGFloat = 5
        
        return HStack {
            Group {
                VStack(alignment: .center, spacing: spacing) {
                    ForEach(product.features) { feature in
                        Image(systemName: feature.type.systemIconName)
                    }
                }
                
                VStack(alignment: .leading, spacing: spacing) {
                    ForEach(product.features) { feature in
                        Text(feature.type.title)
                    }
                }
            }
            .bold()
            .foregroundStyle(.secondary)
            
            Spacer(minLength: 0)
            
            VStack(alignment: .leading, spacing: spacing) {
                ForEach(product.features) { feature in
                    Text(feature.value)
                }
            }
            
            Spacer(minLength: 0)
        }
        .font(.mulish(.medium, size: 16))
        .lineLimit(1)
        .padding()
        .tileBackground()
    }
    
    func compactProductViewRow(title: String, products: [Product]) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.mulish(.extraBold, size: 20))
                .foregroundStyle(.secondary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(products) { product in
                        CompactProductCardView(product: product)
                    }
                }
            }
            .scrollClipDisabled()
        }
    }
}
