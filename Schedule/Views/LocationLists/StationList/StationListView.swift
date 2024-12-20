import SwiftUI

struct StationListView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: StationListViewModel
    
    var onStationSelected: (Station) -> Void
    
    var body: some View {
        VStack {
            SearchFieldView(searchText: $viewModel.searchText)
            
            if viewModel.isSearching && viewModel.filteredStations.isEmpty {
                StubView(message: "Станция не найдена")
            } else {
                List {
                    ForEach(viewModel.filteredStations) { station in
                        LocationRowView(item: station) {
                            onStationSelected(station)
                            presentationMode.wrappedValue.dismiss()
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .background(.ypWhite)
                    }
                }
                .listStyle(.plain)
            }
        }
        .padding(.horizontal, 16)
        .background(.ypWhite)
        .navigationToolbar(title: "Выбор станции", presentationMode: presentationMode)
    }
}
