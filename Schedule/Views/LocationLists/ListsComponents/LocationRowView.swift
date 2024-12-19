import SwiftUI

struct LocationRowView<T: TitledItem>: View {
    let item: T
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(item.title)
                    .baseTextStyle()
                Spacer()
                Image(Assets.chevron)
                    .renderingMode(.template)
                    .foregroundStyle(.ypBlack)
            }
            .padding(.vertical, 19)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    LocationRowView(item: MockDataProvider.mockStation1) { }
}
