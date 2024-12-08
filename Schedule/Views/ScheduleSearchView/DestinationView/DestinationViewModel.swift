import Foundation

final class DestinationViewModel: ObservableObject {
    @Published var settlement: Settlement?
    @Published var station: Station?

    init(settlement: Settlement? = nil, station: Station? = nil) {
        self.settlement = settlement
        self.station = station
    }
}
