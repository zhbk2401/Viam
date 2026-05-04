import SwiftUI

struct InfoRow<V: View>: View {
    @EnvironmentObject var coordinator: Coordinator
    
    let title: String
    let text: String?
    let content: (() -> V)?
    let route: AppRoute?
    
    init(_ title: String, text: String? = nil, route: AppRoute? = nil) where V == EmptyView {
        self.title = title
        self.text = text
        self.content = nil
        self.route = route
    }
    
    init(
        _ title: String,
        text: String? = nil,
        route: AppRoute? = nil,
        @ViewBuilder content: @escaping () -> V,
    ) {
        self.title = title
        self.text = text
        self.content = content
        self.route = route
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.mulish(.medium, size: 16))

            Spacer()
            
            Group {
                if let text = text {
                    Text(text)
                }
                
                if let content = content {
                    content()
                }
                
                if content == nil && text == nil {
                    Image(systemName: "chevron.right")
                        .bold()
                }
            }
            .font(.mulish(.medium, size: 16))
            .multilineTextAlignment(.trailing)
            .foregroundStyle(.secondary)
            .frame(maxWidth: 200, alignment: .trailing)
            .lineLimit(nil)
            .contentTransition(.numericText())
            .animation(.bouncy, value: text)
        }
        .contentShape(Rectangle())
        .listRowBackground(Rectangle().fill(.thinMaterial))
        .onTapGesture {
            if let route = route {
                coordinator.navigate(to: route)
            }
        }
    }
}

extension View {
    func listRowButtonStyle() -> some View {
        self
            .font(.mulish(.extraBold, size: 16))
            .contentShape(Rectangle())
            .listRowBackground(Rectangle().fill(.thinMaterial))
    }
}
 
