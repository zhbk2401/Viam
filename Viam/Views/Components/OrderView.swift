import SwiftUI
import SwiftData

struct OrderView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Bindable var order: Order
    
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
                .conditionalModifier(isActive: isEditable) { view in
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
                infoRow(
                    title: "Total Price per Day",
                    text: order.totalPricePerDay.priceFormatted()
                )
                
                infoRow(
                    title: "Total Days",
                    text: "\(order.daysDuration ?? 0)"
                )
                
                infoRow(
                    title: "Total Price",
                    text: order.totalPrice.priceFormatted()
                )
            }
        }
        .scrollContentBackground(.hidden)
        .animation(.bouncy, value: order.nonEmptyItems)
        .onChange(of: order.nonEmptyItems) { oldValue, newValue in
            if newValue.isEmpty {
                coordinator.goBack()
            }
        }
    }
    
    var orderInfoSection: some View {
        Section("Order Info") {
            infoRow(
                title: "Start Date",
                text: order.startDate?.formatted(date: .abbreviated, time: .omitted) ?? ""
            )
            
            infoRow(
                title: "End Date",
                text: order.endDate?.formatted(date: .abbreviated, time: .omitted) ?? ""
            )
            
            infoRow(
                title: "Receiving Method",
                text: order.receivingMethod?.fullDescription ?? ""
            )
            
            infoRow(
                title: "Dropoff Method",
                text: order.dropoffMethod?.fullDescription ?? ""
            )
        }
    }
    
    var editableOrderInfoSection: some View {
        Section("Order Info") {
            infoRow(
                title: "Start Date",
                content: {
                    DateField(date: $order.startDate, from: Date())
                }
            )
            .onChange(of: order.startDate) { _, newValue in
                if let newValue, let end = order.endDate, newValue > end {
                    order.endDate = nil
                }
            }
            .animation(.bouncy, value: order.startDate)
            
            infoRow(
                title: "End Date",
                content: {
                    DateField(date: $order.endDate, from: Date())
                }
            )
            .animation(.bouncy, value: order.endDate)
            
            infoRow(
                title: "Receiving",
                content: {
                    FulfillmentMethodView(method: $order.receivingMethod)
                }
            )
            
            infoRow(
                title: "Dropoff",
                content: {
                    FulfillmentMethodView(method: $order.dropoffMethod)
                }
            )
        }
    }
    
    func productRow(_ item: OrderItem) -> some View {
        let product = item.product
        
        return HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name)
                    .font(.mulish(.medium, size: 16))
                    .lineLimit(1)
                
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
                        order.addProduct(product)
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
    
    @ViewBuilder
    func infoRow(title: String, text: String) -> some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.mulish(.medium, size: 16))

            Spacer()
            
            Text(text)
                .font(.mulish(.medium, size: 16))
                .multilineTextAlignment(.trailing)
                .foregroundStyle(.secondary)
                .frame(maxWidth: 200, alignment: .trailing)
                .lineLimit(nil)
                .contentTransition(.numericText())
                .animation(.bouncy, value: text)
        }
        .listRowBackground(Rectangle().fill(.thinMaterial))
    }
    
    @ViewBuilder
    func infoRow<V: View>(
        title: String,
        @ViewBuilder content: () -> V
    ) -> some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.mulish(.medium, size: 16))
            
            Spacer()
            content()
                .font(.mulish(.medium, size: 16))
                .multilineTextAlignment(.trailing)
                .foregroundStyle(.secondary)
                .frame(maxWidth: 200, alignment: .trailing)
                .lineLimit(nil)
                .contentTransition(.numericText())
        }
        .listRowBackground(Rectangle().fill(.thinMaterial))
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
    OrderView(coordinator: .init(), order: Order(
        items: [
            .init(product: .mockList[0])
        ],
        startDate: Date(),
        endDate: Date().addingTimeInterval(3600),
        receivingMethod: .courier(Address(city: "Kyiv", street: "Main St 123")),
        dropoffMethod: .pickup(Address(city: "Kyiv", street: "Main St 123, 2ijsfkja awiof a afja  afjk "))
    ), isEditable: true)
}
