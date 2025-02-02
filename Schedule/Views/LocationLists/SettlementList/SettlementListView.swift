import SwiftUI

struct SettlementListView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = SettlementListViewModel()
    @State private var path = NavigationPath()
    
    var onStationSelected: (SelectedStation) -> Void
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if viewModel.loadingFailed {
                    ErrorView(errorType: .serverError)
                } else {
                    VStack {
                        SearchFieldView(searchText: $viewModel.searchText)
                        
                        if viewModel.isSearching && viewModel.filteredSettlements.isEmpty {
                            StubView(message: "Город не найден")
                        } else {
                            List {
                                ForEach(viewModel.filteredSettlements) { settlement in
                                    LocationRowView(item: settlement) {
                                        path.append(settlement)
                                    }
                                    .listRowSeparator(.hidden)
                                    .listRowInsets(EdgeInsets())
                                    .background(.ypWhite)
                                }
                            }
                            .listStyle(.plain)
                            .navigationDestination(for: Settlement.self) { settlement in
                                StationListView(viewModel: StationListViewModel(settlement: settlement)) { station in
                                    onStationSelected(SelectedStation(settlement: settlement, station: station))
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .task {
                await viewModel.fetchSettlements()
            }
            .background(.ypWhite)
            .navigationToolbar(title: "Выбор города", presentationMode: presentationMode)
        }
    }
}

#Preview {
    SettlementListView(
        viewModel: SettlementListViewModel(dataProvider: MockDataProvider()),
        onStationSelected: { _ in }
    )
}
