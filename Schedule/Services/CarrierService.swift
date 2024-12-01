import OpenAPIRuntime
import OpenAPIURLSession

typealias Carrier = Components.Schemas.Carrier

protocol CarrierServiceProtocol {
    func getCarrier(code: String) async throws -> Carrier
}

final class CarrierService: CarrierServiceProtocol {
    enum CarrierServiceError: Error {
        case missingCarrier
    }
    
    private let client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    func getCarrier(code: String) async throws -> Carrier {
        let response = try await client.getCarrier(query: .init(
            code: code
        ))
        guard let carrier = try response.ok.body.json.carrier else {
            throw CarrierServiceError.missingCarrier
        }
        return carrier
    }
}
