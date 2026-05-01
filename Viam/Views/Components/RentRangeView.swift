import SwiftUI

struct RentRangeView: View {
    @Binding var startDate: Date?
    @Binding var endDate: Date?
    var scrollOffset: CGFloat? = nil
    
    
    var body: some View {
        HStack {
            DateField(
                date: $startDate,
                placeholder: "Start Date",
                from: Date()
            )
            .onChange(of: startDate) { _, newValue in
                if let newValue, let end = endDate, newValue > end {
                    endDate = nil
                }
            }
            
            let maxWidth = scrollOffset != nil ? max(20, scrollOffset! / 2) : .infinity
            
            LineArrow(headSize: 8)
                .stroke(.secondary, lineWidth: 2)
                .frame(maxWidth: maxWidth)
                .layoutPriority(-1)
            
            DateField(
                date: $endDate,
                placeholder: "End Date",
                from: startDate
            )
            
            if startDate != nil || endDate != nil {
                Button {
                    startDate = nil
                    endDate = nil
                } label: {
                    Image(systemName: "x.circle.fill")
                }
                .foregroundStyle(.secondary)
            }
        }
        .padding(10)
        .glassEffect(.regular.interactive(), in: RoundedRectangle(cornerRadius: 30))
        .animation(.bouncy, value: startDate)
        .animation(.bouncy, value: endDate)
    }
}
