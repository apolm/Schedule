import SwiftUI

struct CommonTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundStyle(.ypBlack)
    }
}

extension View {
    func commonTextStyle() -> some View {
        self.modifier(CommonTextStyle())
    }
}
