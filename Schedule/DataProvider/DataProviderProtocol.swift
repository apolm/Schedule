import Foundation

protocol DataProviderProtocol {
    func fetchSettlements() async throws -> [Settlement]
}
