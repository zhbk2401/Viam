import SwiftUI

struct ProductView: View {
    @State var showActionSheet = false
    @State var showFullInfo = false
    
    let product: Product
    
    var body: some View {
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
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .background {
            LinearGradient(
                colors: [.primaryInverted.opacity(0.5), .clear],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
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
        }
    }
    
    var header: some View {
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.mulish(.extraBold, size: 30))
            
            PriceView(price: product.price)
                .foregroundStyle(.secondary)
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
            .padding(.bottom, 20)
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
                    .foregroundStyle(.secondaryAccent)
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
        .background {
            RoundedRectangle(cornerRadius: 30)
                .fill(.thinMaterial)
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    
                } label: {
                    Text("Rental now")
                        .font(.mulish(.extraBold, size: 20))
                        .foregroundStyle(.secondaryAccent)
                }
                .buttonStyle(.borderedProminent)
                .tint(.accent)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "heart.fill")
                        .font(.mulish(.extraBold, size: 20))
                        .foregroundStyle(.white)
                }
                .buttonStyle(.borderedProminent)
                .tint(.secondaryAccent)
            }
        }
    }
}

