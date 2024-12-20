import Foundation

struct Station: Identifiable, Hashable, TitledItem {
    let id = UUID()
    let title: String
    let code: String
}
