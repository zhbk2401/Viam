import SwiftUI

struct CarouselView<Data: RandomAccessCollection, Content: View>: View {
    
    let items: Data
    let content: (Data.Element) -> Content
    private let itemWidth: CGFloat = 180
    private let spacing: CGFloat = 5
    
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            let xOffsetToCenter = (geo.size.width - itemWidth) / 2
            
            HStack(spacing: spacing) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    
                    content(item)
                        .frame(width: itemWidth)
                        .scaleEffect(index == currentIndex ? 1 : 0.8)
                        .animation(.easeInOut, value: currentIndex)
                        .zIndex(index == currentIndex ? 1 : 0)
                        .onTapGesture {
                            currentIndex = index
                        }
                }
            }
            .frame(height: geo.size.height)
            .offset(x: -CGFloat(currentIndex) * (itemWidth + spacing) + xOffsetToCenter + dragOffset)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        state = value.translation.width
                    }
                    .onEnded { value in
                        let drag = value.translation.width
                        var newIndex = currentIndex
                        
                        if drag < 0 {
                            newIndex += 1
                        } else if drag > 0 {
                            newIndex -= 1
                        }
                        
                        newIndex = max(0, min(newIndex, items.count - 1))
                        currentIndex = newIndex
                    }
            )
        }
    }
}
