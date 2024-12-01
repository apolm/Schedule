import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestStations = Components.Schemas.Stations

protocol NearestStationsServiceProtocol {
  func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
}

final class NearestStationsService: NearestStationsServiceProtocol {
    private let client: Client
    
    init?() {
        guard let client = ClientFactory.createClient() else { return nil }
        self.client = client
    }
    
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        let response = try await client.getNearestStations(query: .init(
            lat: lat,
            lng: lng,
            distance: distance
        ))
        return try response.ok.body.json
    }
}
