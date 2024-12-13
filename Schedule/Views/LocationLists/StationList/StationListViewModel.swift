import Foundation

final class StationListViewModel: ObservableObject {
    @Published private(set) var stations: [Station]

    init(settlement: Settlement) {
        self.stations = settlement.stations
    }
}

struct SelectedStation {
    let settlement: Settlement
    let station: Station
}
