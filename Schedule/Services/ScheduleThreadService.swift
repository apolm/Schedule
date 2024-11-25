import OpenAPIRuntime
import OpenAPIURLSession

typealias ScheduleThread = Components.Schemas.Thread

protocol ScheduleThreadServiceProtocol {
    func getThread(uid: String) async throws -> ScheduleThread
}

final class ScheduleThreadService: ScheduleThreadServiceProtocol {
    private let client: Client
    
    init?() {
        guard let client = ClientFactory.createClient() else { return nil }
        self.client = client
    }
    
    func getThread(uid: String) async throws -> ScheduleThread {
        let response = try await client.getThread(query: .init(
            apikey: Constants.apiKey,
            uid: uid
        ))
        return try response.ok.body.json
    }
}
