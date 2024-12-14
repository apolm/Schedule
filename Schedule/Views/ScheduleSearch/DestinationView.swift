import SwiftUI

struct DestinationView: View {
    let title: String?
    let placeholder: String

    var body: some View {
        VStack {
            if let title = title {
                Text(title)
                    .foregroundStyle(.ypBlackUniversal)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                Text(placeholder)
                    .foregroundStyle(.ypGrayUniversal)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(14)
        .background(.ypWhiteUniversal)
    }
}

#Preview {
    VStack {
        DestinationView(
            title: nil,
            placeholder: "Откуда"
        )
        
        DestinationView(
            title: "Шереметьево",
            placeholder: "Куда"
        )
    }
}
