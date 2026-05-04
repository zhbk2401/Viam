import SwiftUI
import UIKit

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

extension Double {
    func priceFormatted() -> String {
        self
            .formatted(.currency(code: "UAH").precision(.fractionLength(2)))
            .replacingOccurrences(of: "UAH", with: "₴")
    }
}

extension View {
    @ViewBuilder
    func conditionalModifier<M: View>(
        _ isActive: Bool = true,
        _ modifier: (Self) -> M,
    ) -> some View {
        if isActive {
            modifier(self)
        } else {
            self
        }
    }
    
    func gradientBackground(tinted: Bool = false) -> some View {
        self.background {
            LinearGradient(
                colors: [.backgroundGradientTop, .backgroundGradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
            .overlay(content: {
                Color.backgroundTint.opacity(tinted ? 0.7 : 0)
            })
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
    
    func tileBackground() -> some View {
        self.background {
            RoundedRectangle(cornerRadius: 30)
                .fill(.thinMaterial)
        }
    }
    
    func buttonSized() -> some View {
        self
            .frame(maxWidth: .infinity)
            .frame(height: 48)
    }
    
    func dismissKeyboardOnTap() -> some View {
        self.simultaneousGesture(
            TapGesture().onEnded {
                hideKeyboard()
            }
        )
    }
}

extension String: @retroactive Identifiable {
    public var id: String { self }
}

func hideKeyboard() {
    UIApplication.shared.sendAction(
        #selector(UIResponder.resignFirstResponder),
        to: nil,
        from: nil,
        for: nil
    )
}
