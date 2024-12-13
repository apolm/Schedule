import SwiftUI

final class SettlementListViewModel: ObservableObject {
    @Published private(set) var settlements: [Settlement] = []
    @Published private(set) var isLoading = false
    @Published private(set) var loadingFailed = false
    @Published var searchText: String = ""
    
    private let dataProvider: DataProviderProtocol
    
    var filteredSettlements: [Settlement] {
        if searchText.isEmpty {
            return settlements
        } else {
            return settlements.filter { $0.title.starts(with: searchText) }
        }
    }
    
    init(dataProvider: DataProviderProtocol = DataProvider.shared) {
        self.dataProvider = dataProvider
    }
    
    @MainActor
    func fetchSettlements() async {
        isLoading = true
        loadingFailed = false
        do {
            settlements = try await dataProvider.fetchSettlements()
        } catch {
            print(error.localizedDescription)
            loadingFailed = true
        }
        isLoading = false
    }
}
