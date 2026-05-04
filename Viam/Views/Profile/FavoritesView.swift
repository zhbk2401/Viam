import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Bindable var user: UserInfo
    @Query(sort: \Product.name) private var products: [Product]
    
    var favoriteProducts: [Product] {
        products.filter { product in
            user.favoriteProductCodes.contains(product.code)
        }
    }
    
    var body: some View {
        Group {
            if favoriteProducts.isEmpty {
                Text("You have no favorite products yet.\nTap the heart icon on a product to add it to your favorites!")
                    .font(.mulish(.medium, size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
            } else {
                List {
                    ForEach(favoriteProducts) { product in
                        InlineProductCard(product: product)
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let code = favoriteProducts[index].code
                            user.favoriteProductCodes.removeAll(where: { $0 == code })
                        }
                    }
                    .listRowBackground(Rectangle().fill(.thinMaterial))
                }
            }
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Favorites")
        .navigationBarTitleDisplayMode(.inline)
        .gradientBackground(tinted: true)
    }
}
