import SwiftUI

struct StationListView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: StationListViewModel
    
    var onStationSelected: (Station) -> Void
    
    var body: some View {
        VStack {
            SearchFieldView(searchText: $viewModel.searchText)
            
            if viewModel.filteredStations.isEmpty {
                EmptySearchResultsView(message: "Станция не найдена")
            } else {
                List {
                    ForEach(viewModel.filteredStations) { station in
                        LocationRowView(item: station) {
                            onStationSelected(station)
                            presentationMode.wrappedValue.dismiss()
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(.plain)
            }
        }
        .padding(.horizontal, 16)
        .navigationToolbar(title: "Выбор станции", presentationMode: presentationMode)
    }
}
