import Foundation

struct Settlement: Identifiable, Hashable, TitledItem {
    let id = UUID()
    let title: String
    let stations: [Station]
}
