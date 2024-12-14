import SwiftUI

final class ScheduleListViewModel: ObservableObject, Identifiable {
    let id = UUID()
    let settlementFrom: Settlement
    let stationFrom: Station
    let settlementTo: Settlement
    let stationTo: Station
    
    var title: String {
        "\(settlementFrom.title) (\(stationFrom.title)) → \(settlementTo.title) (\(stationTo.title))"
    }
    
    init(settlementFrom: Settlement, stationFrom: Station, settlementTo: Settlement, stationTo: Station) {
        self.settlementFrom = settlementFrom
        self.stationFrom = stationFrom
        self.settlementTo = settlementTo
        self.stationTo = stationTo
    }
}
