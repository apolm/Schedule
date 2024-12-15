import Foundation

struct Route: Identifiable {
    let id: String
    let date: Date
    let departure: Date
    let arrival: Date
    let durationSeconds: Int
    let hasTransfers: Bool
    let transferPoint: String?
    let carrier: Carrier
}
