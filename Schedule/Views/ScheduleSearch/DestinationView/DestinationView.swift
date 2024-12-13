import SwiftUI

struct DestinationView: View {
    @ObservedObject var viewModel: DestinationViewModel
    let placeholder: String

    var body: some View {
        VStack {
            if let station = viewModel.station {
                Text(station.title)
                    .foregroundColor(.ypBlackUniversal)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                Text(placeholder)
                    .foregroundColor(.ypGrayUniversal)
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
            viewModel: DestinationViewModel(),
            placeholder: "Откуда"
        )
        
        DestinationView(
            viewModel: DestinationViewModel(
                station: Station(
                    title: "Шереметьево"
                )
            ),
            placeholder: "Куда"
        )
    }
}
