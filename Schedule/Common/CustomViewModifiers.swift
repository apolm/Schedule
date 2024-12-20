import SwiftUI

private struct BaseTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundStyle(.ypBlack)
    }
}

extension View {
    func baseTextStyle() -> some View {
        modifier(BaseTextStyle())
    }
}

private struct TitleTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.ypBlack)
    }
}

extension View {
    func titleTextStyle() -> some View {
        modifier(TitleTextStyle())
    }
}

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
