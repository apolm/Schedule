import Foundation

final class MockDataProvider: DataProviderProtocol {
    func fetchSettlements() async throws -> [Settlement] {
        return [Self.mockSettlement1, Self.mockSettlement2]
    }
    
    func fetchRoutes(from: Station, to: Station) async throws -> [Route] {
        return [Self.mockRoute1, Self.mockRoute2, Self.mockRoute3]
    }
}

extension MockDataProvider {
    // Mock Stations
    static var mockStation1: Station {
        Station(
            title: "Внуково",
            code: "s9600215"
        )
    }
    
    static var mockStation2: Station {
        Station(
            title: "Шереметьево",
            code: "s9600213"
        )
    }
    
    static var mockStation3: Station {
        Station(
            title: "Пулково",
            code: "s9600366"
        )
    }
    
    // Mock Settlements
    static var mockSettlement1: Settlement {
        Settlement(
            title: "Москва",
            stations: [
                Self.mockStation1,
                Self.mockStation2
            ]
        )
    }
    
    static var mockSettlement2: Settlement {
        Settlement(
            title: "Санкт-Петербург",
            stations: [
                Self.mockStation3
            ]
        )
    }
    
    // Mock Routes
    static var mockRoute1: Route {
        Route(
            id: "FV-6907_250414_c8565_12",
            date: Date(timeIntervalSince1970: 1744502400), // 2025-04-14T00:00:00
            departure: Date(timeIntervalSince1970: 1744503000), // 2025-04-14T00:10:00
            arrival: Date(timeIntervalSince1970: 1744507800), // 2025-04-14T01:50:00
            durationSeconds: 6000,
            hasTransfers: false,
            transferPoint: nil,
            carrier: Carrier(
                code: "8565",
                title: "Россия",
                logo: "https://yastat.net/s3/rasp/media/data/company/svg/R-30x30__opt.svg",
                email: nil,
                phone: nil
            )
        )
    }
    
    static var mockRoute2: Route {
        Route(
            id: "FV-6951_250331_c8565_12",
            date: Date(timeIntervalSince1970: 1743907200), // 2025-03-31T00:00:00
            departure: Date(timeIntervalSince1970: 1743909000), // 2025-03-31T00:30:00
            arrival: Date(timeIntervalSince1970: 1743916200), // 2025-03-31T02:10:00
            durationSeconds: 6000,
            hasTransfers: false,
            transferPoint: nil,
            carrier: Carrier(
                code: "8565",
                title: "Россия",
                logo: "https://yastat.net/s3/rasp/media/data/company/svg/R-30x30__opt.svg",
                email: nil,
                phone: nil
            )
        )
    }
    
    static var mockRoute3: Route {
        Route(
            id: "SU-42_241220_c26_12",
            date: Date(timeIntervalSince1970: 1734720000), // 2024-12-20T00:00:00
            departure: Date(timeIntervalSince1970: 1734741600), // 2024-12-20T06:00:00
            arrival: Date(timeIntervalSince1970: 1734747000), // 2024-12-20T07:30:00
            durationSeconds: 5400,
            hasTransfers: false,
            transferPoint: nil,
            carrier: Carrier(
                code: "26",
                title: "Аэрофлот",
                logo: "https://yastat.net/s3/rasp/media/data/company/svg/Aeroflot_1.svg",
                email: "callcenter@aeroflot.ru",
                phone: nil
            )
        )
    }
}
