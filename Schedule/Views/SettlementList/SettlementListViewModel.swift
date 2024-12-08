import SwiftUI

final class SettlementListViewModel: ObservableObject {
    @Published private(set) var settlements: [Settlement] = []
    @Published private(set) var isLoading = false
    @Published private(set) var loadingFailed = false
    
    private let dataProvider: DataProviderProtocol
        
    init(dataProvider: DataProviderProtocol = DataProvider.shared) {
        self.dataProvider = dataProvider
    }
    
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
