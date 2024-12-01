import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    let client: Client
    
    private init?() {
        guard let createdClient = ClientFactory.createClient() else { return nil }
        self.client = createdClient
    }
}
