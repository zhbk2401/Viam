import SwiftUI
import SwiftData

struct InlineOrderView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Bindable var order: Order
    
    private var dateText: String {
        "\(order.startDate?.formatted(date: .abbreviated, time: .omitted) ?? "") - \(order.endDate?.formatted(date: .abbreviated, time: .omitted) ?? "")"
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(order.items.toString())
                    .font(.mulish(.extraBold, size: 16))
                    .lineLimit(1)
                
                Text(dateText)
                    .font(.mulish(.medium, size: 14))
                    .lineLimit(1)
                    .foregroundStyle(.secondary)
            }
            
            Spacer(minLength: 0)
            
            Image(systemName: "chevron.right")
                .bold()
                .foregroundStyle(.secondary)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            coordinator.navigate(to: .orderDetails(order))
        }
    }
}

struct OrderView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Bindable var order: Order
    @State private var deletedProductsInfo = ""
    @State private var showDeletedProductsAlert = false
    
    var isEditable: Bool = false
    
    var body: some View {
        List {
            if isEditable {
                editableOrderInfoSection
            } else {
                orderInfoSection
            }
            
            Section("Gear") {
                ForEach(order.nonEmptyItems) { item in
                    productRow(item)
                }
                .conditionalModifier(isEditable) { view in
                    view
                        .onDelete { indexSet in
                            for index in indexSet {
                                let item = order.nonEmptyItems[index]
                                order.removeProduct(item.product)
                            }
                       }
                }
                .listRowBackground(Rectangle().fill(.thinMaterial))
            }
            
            Section("Total") {
                InfoRow("Total Price per Day", text: order.totalPricePerDay.priceFormatted())
                InfoRow("Total Days", text: "\(order.daysDuration ?? 0)")
                InfoRow("Total Price", text: order.totalPrice.priceFormatted())
            }
        }
        .scrollContentBackground(.hidden)
        .gradientBackground(tinted: true)
        .animation(.bouncy, value: order.nonEmptyItems)
        .onChange(of: order.nonEmptyItems) { oldValue, newValue in
            if newValue.isEmpty {
                coordinator.goBack()
            }
        }
        .onChange(of: order.startDate) { oldValue, newValue in
            let deletedProducts = order.deleteUnavailableItems()
            
            if deletedProducts.isEmpty { return }
            deletedProductsInfo = deletedProducts.toString(separator: "\n")
            showDeletedProductsAlert = true
        }
        .onChange(of: order.endDate) { oldValue, newValue in
            let deletedProducts = order.deleteUnavailableItems()
            
            if deletedProducts.isEmpty { return }
            deletedProductsInfo = deletedProducts.toString(separator: "\n")
            showDeletedProductsAlert = true
        }
        .alert("Unavailable Products", isPresented: $showDeletedProductsAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("The following products are unavailable for the selected dates and have been removed from your cart:\n\(deletedProductsInfo)")
        }
    }
    
    var orderInfoSection: some View {
        Section("Order Info") {
            InfoRow("Start Date",
                text: order.startDate?.formatted(date: .abbreviated, time: .omitted) ?? ""
            )
            
            InfoRow("End Date",
                text: order.endDate?.formatted(date: .abbreviated, time: .omitted) ?? ""
            )
            
            InfoRow("Receiving Method",
                text: order.receivingInfo?.fullDescription ?? ""
            )
            
            InfoRow("Dropoff Method",
                text: order.receivingInfo?.fullDescription ?? ""
            )
            
            InfoRow("Payment Method",
                text: order.paymentMethod?.title ?? ""
            )
        }
    }
    
    var editableOrderInfoSection: some View {
        Section("Order Info") {
            InfoRow("Start Date") {
                DateField(date: $order.startDate, from: Date())
            }
            .onChange(of: order.startDate) { _, newValue in
                if let newValue, let end = order.endDate, newValue > end {
                    order.endDate = nil
                }
            }
            .animation(.bouncy, value: order.startDate)
            
            InfoRow("End Date") {
                DateField(date: $order.endDate, from: Date())
            }
            .animation(.bouncy, value: order.endDate)
            
            InfoRow("Receiving") {
                FulfillmentInfoView(info: $order.receivingInfo)
            }
            
            InfoRow("Dropoff") {
                FulfillmentInfoView(info: $order.dropoffInfo)
            }
            
            InfoRow("Payment") {
                PaymentMethodField(paymentMethod: $order.paymentMethod)
            }
        }
    }
    
    func productRow(_ item: OrderItem) -> some View {
        let product = item.product
        
        return HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(product.name)
                        .lineLimit(1)
                    
                    if !isEditable {
                        Text("x\(item.quantity)")
                            .foregroundStyle(.secondary)
                    }
                }
                .font(.mulish(.medium, size: 16))
                
                if isEditable {
                    PriceView(
                        price: item.subtotalPrice,
                        primaryFontSize: 16
                    )
                    .font(.mulish(.medium, size: 16))
                }
            }
            
            Spacer(minLength: 0)
            
            if isEditable {
                HStack {
                    countButton(systemImageName: "minus") {
                        order.removeProduct(product)
                    }

                    Text("x\(item.quantity)")
                        .contentTransition(.numericText())
                        .animation(.bouncy, value: item.quantity)
                        .font(.mulish(.bold, size: 16))
                    
                    countButton(systemImageName: "plus") {
                        guard let startDate = order.startDate,
                              let endDate = order.endDate
                        else {
                            if product.countAvailable > item.quantity {
                                order.addProduct(product)
                            }
                            return
                        }
                        
                        if product.availableCount(for: startDate...endDate) > item.quantity {
                            order.addProduct(product)
                        }
                    }
                }
            } else {
                PriceView(
                    price: item.subtotalPrice,
                    primaryFontSize: 16
                )
                .font(.mulish(.medium, size: 16))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onTapGesture {
            coordinator.navigate(to: .prodoctPage(product))
        }
    }
    
    
    
    func countButton(systemImageName: String, action: @escaping () -> Void) -> some View {
        Button {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            action()
        } label: {
            Image(systemName: systemImageName)
                .bold()
                .font(.caption)
                .padding(4)
        }
        .foregroundStyle(.white)
        .frame(width: 24, height: 24)
        .foregroundStyle(.secondary)
        .buttonStyle(.plain)
        .glassEffect(.regular.interactive().tint(.secondaryAccent))
    }
}

#Preview {
    OrderView(coordinator: .init(), order: .mockList[0], isEditable: true)
}
