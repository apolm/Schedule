import Foundation

final class StationListViewModel: ObservableObject {
    @Published private(set) var stations: [Station]
    @Published var searchText: String = ""
    
    var filteredStations: [Station] {
        if searchText.isEmpty {
            return stations
        } else {
            return stations.filter { $0.title.starts(with: searchText) }
        }
    }

    init(settlement: Settlement) {
        self.stations = settlement.stations
    }
}

struct SelectedStation {
    let settlement: Settlement
    let station: Station
}
