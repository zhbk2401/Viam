import SwiftUI

//MARK: Font Extension
extension Font {
    enum MulishFont: String {
        case black = "Mulish-Black"
        case blackItalic = "Mulish-BlackItalic"
        case bold = "Mulish-Bold"
        case boldItalic = "Mulish-BoldItalic"
        case extraBold = "Mulish-ExtraBold"
        case extraBoldItalic = "Mulish-ExtraBoldItalic"
        case extraLight = "Mulish-ExtraLight"
        case extraLightItalic = "Mulish-ExtraLightItalic"
        case italic = "Mulish-Italic"
        case light = "Mulish-Light"
        case lightItalic = "Mulish-LightItalic"
        case medium = "Mulish-Medium"
        case mediumItalic = "Mulish-MediumItalic"
        case regular = "Mulish-Regular"
        case semiBold = "Mulish-SemiBold"
        case semiBoldItalic = "Mulish-SemiBoldItalic"
    }
    
    static func mulish(_ type: MulishFont, size: CGFloat = 20) -> Font {
        return .custom(type.rawValue, size: size)
    }
}

extension View {
    @ViewBuilder
    func conditionalModifier<M: View>(
        isActive: Bool = true,
        _ modifier: (Self) -> M,
    ) -> some View {
        if isActive {
            modifier(self)
        } else {
            self
        }
    }
    
    func gradientBackground() -> some View {
        self.background {
            LinearGradient(
                colors: [.backgroundGradientTop, .backgroundGradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        }
    }
    
    func buttonContentStyle<S: ShapeStyle>(fill: S) -> some View {
        self
            .font(.mulish(.extraBold, size: 20))
            .padding(.horizontal, 12)
            .background {
                Capsule().fill(fill)
                    .frame(height: 56)
                    .frame(minWidth: 56)
            }
    }
}
