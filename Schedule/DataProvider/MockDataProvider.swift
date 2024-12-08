import Foundation

final class MockDataProvider: DataProviderProtocol {
    func fetchSettlements() async throws -> [Settlement] {
        let moscow = Settlement(title: "Москва", stations: [Station(title: "Курский вокзал"), Station(title: "Белорусский вокзал")])
        let stPetersburg = Settlement(title: "Санкт-Петербург", stations: [Station(title: "Московский вокзал"), Station(title: "Витебский вокзал")])
        return [moscow, stPetersburg]
    }
}
