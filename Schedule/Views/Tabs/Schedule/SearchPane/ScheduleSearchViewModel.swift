import SwiftUI

final class ScheduleSearchViewModel: ObservableObject {
    @Published var settlementFrom: Settlement?
    @Published var stationFrom: Station?
    @Published var settlementTo: Settlement?
    @Published var stationTo: Station?
    
    func swapDestinations() {
        let tempSettlement = settlementFrom
        let tempStation = stationFrom
        settlementFrom = settlementTo
        stationFrom = stationTo
        settlementTo = tempSettlement
        stationTo = tempStation
    }
}
