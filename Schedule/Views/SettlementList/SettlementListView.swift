import SwiftUI

struct SettlementListView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: SettlementListViewModel
    var onStationSelected: (SelectedStation) -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if viewModel.loadingFailed {
                    Text("error").foregroundColor(.red) // TODO - Show error View
                } else {
                    List(viewModel.settlements) { settlement in
                        NavigationLink(destination: StationListView(viewModel: StationListViewModel(settlement: settlement)) { station in
                            onStationSelected(SelectedStation(settlement: settlement, station: station))
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text(settlement.title)
                        }
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchSettlements()
                }
            }
            .navigationTitle("Выбор города")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left.circle.fill")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    SettlementListView(
        viewModel: SettlementListViewModel(dataProvider: MockDataProvider()),
        onStationSelected: { _ in }
    )
}
