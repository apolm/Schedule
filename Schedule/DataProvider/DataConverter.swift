import Foundation

struct DataConverter {
    func convertSettlements(from response: StationsList) throws -> [Settlement] {
        guard let countries = response.countries,
              let country = countries.first(where: { $0.title == "Россия" }),
              let regions = country.regions else {
            throw DataConverterError.dataConversionError
        }
        
        return regions.flatMap { region in
            region.settlements?.compactMap { stationSettlement in
                guard let title = stationSettlement.title,
                      !title.isEmpty else { return nil }
                let stations = stationSettlement.stations?.map { Station(title: $0.title ?? "") } ?? []
                return Settlement(title: title, stations: stations)
            } ?? []
        }
        .sorted { $0.title < $1.title }
    }
}

enum DataConverterError: Error {
    case dataConversionError
}
