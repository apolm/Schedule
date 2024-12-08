import SwiftUI

struct SettlementListView: View {
    @StateObject var viewModel: SettlementListViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if viewModel.loadingFailed {
                Text("error").foregroundColor(.red) // TODO - Show error View
            } else {
                List(viewModel.settlements) { settlement in
                    Text(settlement.title)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchSettlements()
            }
        }
    }
}

#Preview {
    SettlementListView(
        viewModel: SettlementListViewModel(
            dataProvider: MockDataProvider()
        )
    )
}
