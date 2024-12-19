import SwiftUI

struct MainTabView: View {
    @StateObject var searchViewModel = ScheduleSearchViewModel()
    @State private var scheduleListViewModel: ScheduleListViewModel?
    
    var body: some View {
        TabView {
                VStack(spacing: 16) {
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
                                stationTo: stationTo,
                                dataProvider: MockDataProvider()
                            )
                        } label: {
                            Text("Найти")
                                .font(.body)
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
                .padding(.top, 16)
                .background(.ypWhite)
            .tabItem {
                Image(Assets.tabSchedule)
                    .renderingMode(.template)
                    .foregroundStyle(.ypBlack)
                
            }
            
            SettingsTabView()
            .tabItem {
                Image(Assets.tabSettings)
                    .renderingMode(.template)
                    .foregroundStyle(.ypBlack)
            }
        }
        .tint(.ypBlack)
        .fullScreenCover(item: $scheduleListViewModel) { scheduleListViewModel in
            ScheduleListView(viewModel: scheduleListViewModel)
        }
    }
}

#Preview {
    MainTabView()
}
