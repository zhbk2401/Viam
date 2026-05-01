import SwiftUI

struct DateField: View {
    @Binding var date: Date?
    @State private var showPopover = false
    @State private var tempDate = Date()
    
    var placeholder: String = "Not Set"
    var from: Date? = nil
    var to: Date? = nil
    
    private var range: ClosedRange<Date> {
        let lower = from ?? Date.distantPast
        let upper = to ?? Date.distantFuture
        return lower...upper
    }
    
    private var dateText: String {
        date?.formatted(date: .abbreviated, time: .omitted) ?? placeholder
    }
    
    var body: some View {
        Button {
            tempDate = date ?? Date()
            showPopover = true
        } label: {
            Text(dateText)
        }
        .foregroundStyle(date == nil ? .secondary : .primary)
        .buttonStyle(.bordered)
        .sheet(isPresented: $showPopover) {
            datePicker
        }
        .onChange(of: date) {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        }
        .lineLimit(1)
        .font(.mulish(.medium, size: 16))
    }
    
    var datePicker: some View {
        NavigationView {
            DatePicker(
                "",
                selection: $tempDate,
                in: range,
                displayedComponents: .date
            )
            .datePickerStyle(.graphical)
            .padding()
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("", systemImage: "checkmark") {
                        date = tempDate
                        showPopover = false
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("", systemImage: "xmark") {
                        showPopover = false
                    }
                }
                
                ToolbarSpacer(placement: .topBarLeading)
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Today") {
                        tempDate = Date()
                    }
                }
            }
        }
        .presentationDetents([.medium])
    }
}
    
