import SwiftUI

struct BaseTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundStyle(.ypBlack)
    }
}

extension View {
    func baseTextStyle() -> some View {
        self.modifier(BaseTextStyle())
    }
}

struct TitleTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.ypBlack)
    }
}

extension View {
    func titleTextStyle() -> some View {
        self.modifier(TitleTextStyle())
    }
}
