import SwiftUI

final class ScheduleSearchViewModel: ObservableObject {
    @Published private(set) var settlementFrom: Settlement?
    @Published private(set) var stationFrom: Station?
    
    @Published private(set) var settlementTo: Settlement?
    @Published private(set) var stationTo: Station?
}
