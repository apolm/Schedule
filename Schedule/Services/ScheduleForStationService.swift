import OpenAPIRuntime
import OpenAPIURLSession

typealias ScheduleForStation = Components.Schemas.ScheduleForStation

protocol ScheduleForStationServiceProtocol {
    func getScheduleForStation(_: String) async throws -> ScheduleForStation
}

final class ScheduleForStationService: ScheduleForStationServiceProtocol {
    private let client: Client
    
    init?() {
        guard let client = ClientFactory.createClient() else { return nil }
        self.client = client
    }
    
    func getScheduleForStation(_ station: String) async throws -> ScheduleForStation {
        let response = try await client.getScheduleForStation(query: .init(
            apikey: Constants.apiKey,
            station: station
        ))
        return try response.ok.body.json
    }
}

