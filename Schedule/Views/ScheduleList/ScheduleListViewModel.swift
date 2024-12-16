import SwiftUI

final class ScheduleListViewModel: ObservableObject, Identifiable {
    @Published private(set) var routes: [Route] = []
    @Published private(set) var isLoading = false
    @Published private(set) var loadingFailed = false
    @Published private(set) var filterIsOn = false
    
    let id = UUID()
    let settlementFrom: Settlement
    let stationFrom: Station
    let settlementTo: Settlement
    let stationTo: Station
    
    var title: String {
        "\(settlementFrom.title) (\(stationFrom.title)) → \(settlementTo.title) (\(stationTo.title))"
    }
    
    private let dataProvider: DataProviderProtocol
    
    init(
        settlementFrom: Settlement,
        stationFrom: Station,
        settlementTo: Settlement,
        stationTo: Station,
        dataProvider: DataProviderProtocol = DataProvider.shared
    ) {
        self.settlementFrom = settlementFrom
        self.stationFrom = stationFrom
        self.settlementTo = settlementTo
        self.stationTo = stationTo
        self.dataProvider = dataProvider
    }
    
    @MainActor
    func fetchRoutes() async {
        isLoading = true
        loadingFailed = false
        do {
            routes = try await dataProvider.fetchRoutes(from: stationFrom, to: stationTo)
        } catch {
            print(error.localizedDescription)
            loadingFailed = true
        }
        isLoading = false
    }
}
