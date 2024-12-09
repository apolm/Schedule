import SwiftUI

struct ScheduleSearchView: View {
    @StateObject var viewModel: ScheduleSearchViewModel
    @StateObject private var fromViewModel = DestinationViewModel()
    @StateObject private var toViewModel = DestinationViewModel()
    @State private var isPresentingDestinationSelection = false
    @State private var selectingFrom = true
    
    var body: some View {
        HStack(spacing: 16) {
            VStack(spacing: 0) {
                DestinationView(viewModel: fromViewModel, placeholder: "Откуда")
                    .onTapGesture {
                        selectingFrom = true
                        isPresentingDestinationSelection = true
                    }
                DestinationView(viewModel: toViewModel, placeholder: "Куда")
                    .onTapGesture {
                        selectingFrom = false
                        isPresentingDestinationSelection = true
                    }
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Button(action: {
                // TODO Button action here
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
                    
                    fromViewModel.settlement = selectedStation.settlement
                    fromViewModel.station = selectedStation.station
                } else {
                    viewModel.settlementTo = selectedStation.settlement
                    viewModel.stationTo = selectedStation.station
                    
                    toViewModel.settlement = selectedStation.settlement
                    toViewModel.station = selectedStation.station
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
