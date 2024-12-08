import SwiftUI

struct DestinationView: View {
    @ObservedObject var viewModel: DestinationViewModel
    let placeholder: String

    var body: some View {
        VStack {
            if let station = viewModel.station {
                Text(station.title)
                    .foregroundColor(.black)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                Text(placeholder)
                    .foregroundColor(.gray)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(14)
        .background(Color.white)
    }
}

#Preview {
    DestinationView(viewModel: DestinationViewModel(), placeholder: "Откуда")
}
