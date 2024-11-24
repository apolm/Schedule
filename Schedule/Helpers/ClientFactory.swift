import OpenAPIURLSession

struct ClientFactory {
    static func createClient() -> Client? {
        do {
            return try Client(
                serverURL: Servers.Server1.url(),
                transport: URLSessionTransport()
            )
        } catch {
            print("Failed to create client: \(error.localizedDescription)")
            return nil
        }
    }
}
