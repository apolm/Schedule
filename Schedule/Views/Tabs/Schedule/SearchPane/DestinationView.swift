import SwiftUI

struct DestinationView: View {
    let settlementTitle: String?
    let stationTitle: String?
    let placeholder: String
    
    var body: some View {
        VStack {
            if let settlementTitle = settlementTitle,
            let stationTitle = stationTitle {
                Text("\(settlementTitle) (\(stationTitle))")
                    .foregroundStyle(.ypBlackUniversal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
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
            settlementTitle: nil,
            stationTitle: nil,
            placeholder: "Откуда"
        )
        
        DestinationView(
            settlementTitle: "Москва",
            stationTitle: "Шереметьево",
            placeholder: "Куда"
        )
    }
}
