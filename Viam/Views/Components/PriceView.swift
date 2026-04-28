import SwiftUI

struct PriceView: View {
    let price: Double
    
    var body: some View {
        HStack(spacing: 5) {
            Text("\(price.formatted(.currency(code: "")))₴")
                .font(.mulish(.extraBold, size: 20))
            
            Group {
                Text("/")
                Text("day")
            }
            .foregroundStyle(.secondary)
            .font(.mulish(.bold, size: 14))
        }
    }
}
