import SwiftUI

struct PriceView: View {
    let price: Double
    var primaryFontSize: CGFloat = 20
    var secondaryFontSize: CGFloat = 14
    
    
    var body: some View {
        HStack(spacing: 5) {
            Text(price.priceFormatted())
                .font(.mulish(.extraBold, size: primaryFontSize))
                .contentTransition(.numericText())
                .animation(.bouncy, value: price)
            
            Group {
                Text("/")
                Text("day")
            }
            .foregroundStyle(.secondary)
            .font(.mulish(.bold, size: secondaryFontSize))
        }
    }
}
