import SwiftUI

struct LocationRowView<T: TitledItem>: View {
    let item: T
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(item.title)
                    .commonTextStyle()
                Spacer()
                Image(Assets.chevron)
                    .renderingMode(.template)
            }
            .padding(.vertical, 19)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    LocationRowView(item: Station(title: "Внуково")) { }
}
