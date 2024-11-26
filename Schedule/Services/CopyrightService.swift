import OpenAPIRuntime
import OpenAPIURLSession

typealias Copyright = Components.Schemas.Copyright

protocol CopyrightServiceProtocol {
  func getCopyright() async throws -> Copyright
}

final class CopyrightService: CopyrightServiceProtocol {
    enum CopyrightServiceError: Error {
        case missingCopyright
    }
    
    private let client: Client
    
    init?() {
        guard let client = ClientFactory.createClient() else { return nil }
        self.client = client
    }
    
    func getCopyright() async throws -> Copyright {
        let response = try await client.getCopyright(query: .init(
            apikey: Constants.apiKey
        ))
        guard let copyright = try response.ok.body.json.copyright else {
            throw CopyrightServiceError.missingCopyright
        }
        return copyright
    }
}
