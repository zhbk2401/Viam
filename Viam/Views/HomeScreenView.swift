import SwiftUI
import SwiftData

struct HomeScreenView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Environment(\.currentUser) private var currentUser
    @Query(sort: \Product.name) private var products: [Product]
    
    @State private var scrollOffset: CGFloat = 0
    @State var searchText: String = ""
    @State var selectedCategory: Category? = nil
    @State private var deletedProductsInfo = ""
    @State private var showDeletedProductsAlert = false
    
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
            .filter { product in
                guard
                    let startDate = currentUser.cart.startDate,
                    let endDate = currentUser.cart.endDate
                else { return true }
                
                return product.availableCount(for: startDate...endDate) > 0
            }
    }
    
    var body: some View {
        @Bindable var currentUser = currentUser
        
        ZStack(alignment: .top) {
            header
                .zIndex(scrollOffset < 20 ? 1 : -1)
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
                .frame(height: 190)

                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(filteredProducts) { product in
                            ProductCardView(product: product)
                        }
                    } header: {
                        filters(
                            startDate: $currentUser.cart.startDate,
                            endDate: $currentUser.cart.endDate
                        )
                    }
                }
                .padding()
            }
        }
        .coordinateSpace(name: "scroll")
        .padding(.top, -50)
        .searchable(text: $searchText, placement: .automatic, prompt: "Search for products")
        .searchToolbarBehavior(currentUser.cart.itemCount == 0 ? .automatic : .minimize)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gradientBackground()
        .toolbar {
            if currentUser.cart.itemCount > 0 {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        coordinator.navigate(to: .cart(currentUser))
                    } label: {
                        HStack {
                            Image(systemName: "cart.fill")
                            Text("Cart")
                                .font(.mulish(.extraBold, size: 20))
                            Text("(\(currentUser.cart.itemCount))")
                                .font(.mulish(.extraBold, size: 20))
                                .opacity(0.6)
                        }
                        .foregroundStyle(.secondaryAccent)
                        .padding(.trailing, 5)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.accent)
                }
            }
            
            ToolbarSpacer(.flexible, placement: .bottomBar)
            DefaultToolbarItem(kind: .search, placement: .bottomBar)
        }
        .animation(.bouncy, value: searchText)
        .animation(.bouncy, value: selectedCategory)
        .animation(.bouncy, value: currentUser.cart.itemCount)
        .onChange(of: scrollOffset) { oldValue, newValue in
            if newValue <= 0, oldValue > 0 {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            } else if newValue >= 220, oldValue < 220 {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
        .alert("Unavailable Products", isPresented: $showDeletedProductsAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("The following products are unavailable for the selected dates and have been removed from your cart:\n\(deletedProductsInfo)")
        }
        .onAppear {
//            coordinator.navigate(to: .profile(currentUser))
        }
    }
    
    var header: some View {
        VStack {
            HStack {
                Text("Viam")
                    .font(.mulish(.extraBold, size: 32))
                Spacer()
                
                Button {
                    print("User")
                    coordinator.navigate(to: .profile(currentUser))
                } label: {
                    let image = if let avatar = currentUser.avatar {
                        Image(uiImage: avatar)
                    } else {
                        Image(systemName: "person.crop.circle")
                    }
                    
                    image
                        .resizable()
                        .frame(width: 34, height: 34)
                        .clipShape(Circle())
                        .padding(5)
                        .glassEffect(.regular.interactive())
                }
                .foregroundStyle(.primary)
            }
            
            Text("The mountains are calling — we’ve got the gear")
                .font(.mulish(.regular, size: 32))
        }
    }
    
    func filters(startDate: Binding<Date?>, endDate: Binding<Date?>) -> some View {
        VStack(alignment: .leading) {
            RentRangeView(
                startDate: startDate,
                endDate: endDate,
                scrollOffset: scrollOffset
            )
            .onChange(of: startDate.wrappedValue) { oldValue, newValue in
                let deletedProducts = currentUser.cart.deleteUnavailableItems()
                if deletedProducts.isEmpty { return }
                deletedProductsInfo = deletedProducts.toString(separator: "\n")
                showDeletedProductsAlert = true
            }
            .onChange(of: endDate.wrappedValue) { oldValue, newValue in
                let deletedProducts = currentUser.cart.deleteUnavailableItems()
                if deletedProducts.isEmpty { return }
                deletedProductsInfo = deletedProducts.toString(separator: "\n")
                showDeletedProductsAlert = true
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CategoryView(
                        title: "All",
                        isSelected: selectedCategory == nil
                    )
                    .onTapGesture {
                        selectedCategory = nil
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
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
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        }
                    }
                }
            }
            .scrollClipDisabled()
        }
        .background {
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(
                    LinearGradient(
                        colors: [.primary, .primary, .clear],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(-100)
                .opacity(min(max((scrollOffset - 150) / 100, 0), 1))
        }
    }
}
