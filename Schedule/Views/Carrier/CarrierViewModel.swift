import SwiftUI

@MainActor
final class CarrierViewModel: ObservableObject {
    private let carrier: Carrier
    
    var title: String {
        carrier.title
    }
    
    var logoURL: URL? {
        URL(string: carrier.logoFull)
    }
    
    var email: String {
        carrier.email ?? "-"
    }
    
    var phone: String {
        carrier.phone ?? "-"
    }
    
    init(carrier: Carrier) {
        self.carrier = carrier
    }
}
