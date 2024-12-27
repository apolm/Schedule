import SwiftUI

struct ScheduleTabView: View {
    @StateObject var searchViewModel = ScheduleSearchViewModel()
    @State private var scheduleListViewModel: ScheduleListViewModel?
    
    var body: some View {
        VStack(spacing: 16) {
            StoriesGroupScrollView()
                .padding(.vertical, 24)
                .ignoresSafeArea(edges: .horizontal)
            
            ScheduleSearchView(viewModel: searchViewModel)
                .padding(.horizontal, 16)
            
            if let stationFrom = searchViewModel.stationFrom,
               let stationTo = searchViewModel.stationTo,
               let settlementFrom = searchViewModel.settlementFrom,
               let settlementTo = searchViewModel.settlementTo {
                Button {
                    scheduleListViewModel = ScheduleListViewModel(
                        settlementFrom: settlementFrom,
                        stationFrom: stationFrom,
                        settlementTo: settlementTo,
                        stationTo: stationTo
                    )
                } label: {
                    Text("Найти")
                        .bold()
                        .foregroundStyle(.ypWhiteUniversal)
                        .padding(.horizontal, 47.5)
                        .padding(.vertical, 20)
                        .background(Color.ypBlue)
                        .cornerRadius(16)
                }
            }
            
            Spacer()
        }
        .background(.ypWhite)
        .fullScreenCover(item: $scheduleListViewModel) { scheduleListViewModel in
            ScheduleListView(viewModel: scheduleListViewModel)
        }
    }
}

#Preview {
    ScheduleTabView()
}
