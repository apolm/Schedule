import Foundation

struct Station: Identifiable, Hashable, TitledItem, Sendable {
    let id = UUID()
    let title: String
    let code: String
}
