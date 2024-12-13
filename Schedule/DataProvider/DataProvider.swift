import Foundation

final class DataProvider: DataProviderProtocol {
    static let shared = DataProvider()
    private let converter = DataConverter()
    private var settlements: [Settlement]?
    
    private init() {}
    
    func fetchSettlements() async throws -> [Settlement] {
        if let cachedSettlements = settlements {
            return cachedSettlements
        }
        
        let response = try await ServiceManager.shared.getStationsList()
        let convertedSettlements = try converter.convertSettlements(from: response)
        settlements = convertedSettlements
        return convertedSettlements
    }
}