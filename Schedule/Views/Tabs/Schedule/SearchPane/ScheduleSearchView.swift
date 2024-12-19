import SwiftUI

struct ScheduleSearchView: View {
    @StateObject var viewModel: ScheduleSearchViewModel
    @State private var isPresentingDestinationSelection = false
    @State private var selectingFrom = true
    
    var body: some View {
        HStack(spacing: 16) {
            VStack(spacing: 0) {
                DestinationView(
                    settlementTitle: viewModel.settlementFrom?.title,
                    stationTitle: viewModel.stationFrom?.title,
                    placeholder: "Откуда"
                )
                .onTapGesture {
                    selectingFrom = true
                    isPresentingDestinationSelection = true
                }
                
                DestinationView(
                    settlementTitle: viewModel.settlementTo?.title,
                    stationTitle: viewModel.stationTo?.title,
                    placeholder: "Куда"
                )
                .onTapGesture {
                    selectingFrom = false
                    isPresentingDestinationSelection = true
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Button(action: {
                viewModel.swapDestinations()
            }) {
                Image(Assets.changeDirection)
                    .frame(width: 36, height: 36)
                    .background(.ypWhiteUniversal)
                    .clipShape(Circle())
            }
        }
        .padding(16)
        .background(.ypBlue)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .fullScreenCover(isPresented: $isPresentingDestinationSelection) {
            SettlementListView(viewModel: SettlementListViewModel(dataProvider: MockDataProvider())) { selectedStation in
                if selectingFrom {
                    viewModel.settlementFrom = selectedStation.settlement
                    viewModel.stationFrom = selectedStation.station
                } else {
                    viewModel.settlementTo = selectedStation.settlement
                    viewModel.stationTo = selectedStation.station
                }
            }
        }
    }
}

#Preview {
    ScheduleSearchView(viewModel: ScheduleSearchViewModel())
        .padding()
        .previewLayout(.sizeThatFits)
}
