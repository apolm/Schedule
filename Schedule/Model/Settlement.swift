import Foundation

struct Settlement: Identifiable {
    let id = UUID()
    let title: String
    let stations: [Station]
}
