import OpenAPIURLSession
import OpenAPIRuntime
import Foundation
import HTTPTypes

struct ClientFactory {
    static func createClient() -> Client? {
        do {
            return try Client(
                serverURL: Servers.Server1.url(),
                transport: URLSessionTransport(),
                middlewares: [AuthenticationMiddleware(authorizationHeaderFieldValue: Constants.apiKey)]
            )
        } catch {
            print("Failed to create client: \(error.localizedDescription)")
            return nil
        }
    }
}
