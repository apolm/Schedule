import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            stations()
            settlement()
            carrier()
        }
    }
}

extension ContentView {
    func stations() {
        guard let service = NearestStationsService() else { return }
        
        Task {
            do {
                let stations = try await service.getNearestStations(
                    lat: 59.864177,
                    lng: 30.319163,
                    distance: 50
                )
                print("\n>> Successfully loaded Stations (\(stations.stations?.count ?? 0))")
            } catch {
                print("\n!! Failed to load stations: \(error.localizedDescription)")
            }
        }
    }
    
    func settlement() {
        guard let service = NearestSettlementService() else { return }
        
        Task {
            do {
                let settlement = try await service.getNearestSettlement(
                    lat: 55.751244,
                    lng: 37.618423,
                    distance: 20
                )
                print("\n>> Successfully loaded Settlement: \(settlement.title ?? "Unknown")")
            } catch {
                print("\n!! Failed to load Settlement: \(error.localizedDescription)")
            }
        }
    }
    
    func carrier() {
        guard let service = CarrierService() else { return }
        
        Task {
            do {
                let carrier = try await service.getCarrier(code: "26")
                print("\n>> Successfully loaded Carrier: \(carrier.title ?? "Unknown")")
            } catch {
                print("\n!! Failed to load Carrier: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ContentView()
}
