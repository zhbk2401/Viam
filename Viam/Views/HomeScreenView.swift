import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject var coordinator: Coordinator
    @State private var scrollOffset: CGFloat = 0
    @State var searchText: String = ""
    @State var selectedCategory: Category? = nil
    
    
    var filteredProducts: [Product] {
        products
            .filter { product in
                searchText.isEmpty ||
                product.name.localizedCaseInsensitiveContains(searchText) ||
                product.info.localizedCaseInsensitiveContains(searchText)
            }
            .filter { product in
                selectedCategory == nil || product.category == selectedCategory
            }
    }
    
    let products: [Product] = [
        Product(
            name: "Hiking Backpack",
            info: "Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the. Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the.",
            price: 129.99,
            category: .backpacks,
            features: [
                Feature(.capacity, value: "30"),
                Feature(.size, value: "XL"),
            ],
            imageData: UIImage(systemName: "person.circle")?.jpegData(compressionQuality: 1.0)
        ),
        
        Product(
            name: "Trail Running Shoes",
            info: "Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the. Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the.",
            price: 89.99,
            category: .clothing
        ),
        
        Product(
            name: "Trail Running Shoes",
            info: "Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the. Backpack comfort depends on its balance while walking. The Symbium concept features an articulated hip belt that allows the pack to adapt to the.",
            price: 89.99,
            category: .clothing
        ),
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            header
                .padding()
                .blur(radius: min(max(scrollOffset / 10, 0), 200))
            
            ScrollView {
                GeometryReader { geo in
                    Spacer()
                        .onChange(of: geo.frame(in: .named("scroll")).minY) { _, newValue in
                            Task { @MainActor in
                                self.scrollOffset = -newValue
                            }
                        }
                }
                .frame(height: 200)

                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(filteredProducts) { product in
                            ProductCardView(product: product)
                                .onTapGesture {
                                    coordinator.navigate(to: .prodoctCard(product))
                                }
                        }
                    } header: {
                        filters
                    }
                }
                .padding()
            }
            
        }
        .coordinateSpace(name: "scroll")
        .padding(.top, -50)
        .searchable(text: $searchText, placement: .automatic, prompt: "Search for products")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            LinearGradient(
                colors: [.backgroundGradientTop, .backgroundGradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        }
        .animation(.bouncy, value: searchText)
        .animation(.bouncy, value: selectedCategory)
    }
    
    var header: some View {
        VStack {
            HStack {
                Text("Viam")
                    .font(.mulish(.extraBold, size: 32))
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 34, height: 34)
                        .padding(5)
                        .glassEffect(.regular)
                }
                .foregroundStyle(.primary)
            }
            
            Text("The mountains are calling — we’ve got the gear")
                .font(.mulish(.regular, size: 32))
        }
    }
    
    var filters: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                CategoryView(
                    title: "All",
                    isSelected: selectedCategory == nil
                )
                .onTapGesture {
                    selectedCategory = nil
                }
                
                ForEach(Category.allCases) { category in
                    CategoryView(
                        title: category.title,
                        isSelected: selectedCategory == category
                    )
                    .onTapGesture {
                        if selectedCategory == category {
                            selectedCategory = nil
                        } else {
                            selectedCategory = category
                        }
                    }
                }
            }
        }
        .scrollClipDisabled()
    }
}
