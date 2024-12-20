import Foundation

protocol DataProviderProtocol {
    func fetchSettlements() async throws -> [Settlement]
    func fetchRoutes(from: Station, to: Station) async throws -> [Route]
}
