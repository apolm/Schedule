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
        .task {
            await scheduleBetweenStations()
            await scheduleForStation()
            await scheduleThread()
            await stations()
            await settlement()
            await carrier()
            await stationsList()
            await copyright()
        }
    }
}

extension ContentView {
    func scheduleBetweenStations() async {
        guard let client = NetworkManager.shared?.client else { return }
        let service = ScheduleBetweenStationsService(client: client)
        
        do {
            let schedule = try await service.getScheduleBetweenStations(from: "c146", to: "c213")
            print("\n>> Successfully loaded schedule between stations (\(schedule.segments?.count ?? 0))")
        } catch {
            print("\n!! Failed to load schedule between stations: \(error.localizedDescription)")
        }
    }
    
    func scheduleForStation() async {
        guard let client = NetworkManager.shared?.client else { return }
        let service = ScheduleForStationService(client: client)
        
        do {
            let schedule = try await service.getScheduleForStation("s9600213")
            print("\n>> Successfully loaded schedule for station: \(schedule.station?.title ?? "")")
        } catch {
            print("\n!! Failed to load schedule for station: \(error.localizedDescription)")
        }
    }
    
    func scheduleThread() async {
        guard let client = NetworkManager.shared?.client else { return }
        let service = ScheduleThreadService(client: client)
        
        do {
            let scheduleThread = try await service.getThread(uid: "SU-1524_250111_c26_12")
            print("\n>> Successfully loaded Thread: \(scheduleThread.title ?? "")")
        } catch {
            print("\n!! Failed to load Thread: \(error.localizedDescription)")
        }
    }
    
    func stations() async {
        guard let client = NetworkManager.shared?.client else { return }
        let service = NearestStationsService(client: client)
        
        do {
            let stations = try await service.getNearestStations(
                lat: 59.864177,
                lng: 30.319163,
                distance: 50
            )
            print("\n>> Successfully loaded Stations (\(stations.stations?.count ?? 0))")
        } catch {
            print("\n!! Failed to load Stations: \(error.localizedDescription)")
        }
    }
    
    func settlement() async {
        guard let client = NetworkManager.shared?.client else { return }
        let service = NearestSettlementService(client: client)
        
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
    
    func carrier() async {
        guard let client = NetworkManager.shared?.client else { return }
        let service = CarrierService(client: client)
        
        do {
            let carrier = try await service.getCarrier(code: "26")
            print("\n>> Successfully loaded Carrier: \(carrier.title ?? "Unknown")")
        } catch {
            print("\n!! Failed to load Carrier: \(error.localizedDescription)")
        }
    }
    
    func stationsList() async {
        guard let client = NetworkManager.shared?.client else { return }
        let service = StationsListService(client: client)
        
        do {
            let stationsList = try await service.getStationsList()
            print("\n>> Successfully loaded Stations List (countries: \(stationsList.countries?.count ?? 0))")
        } catch {
            print("\n!! Failed to load Stations List: \(error.localizedDescription)")
        }
    }
    
    func copyright() async {
        guard let client = NetworkManager.shared?.client else { return }
        let service = CopyrightService(client: client)
        
        do {
            let copyrightInfo = try await service.getCopyright()
            print("\n>> Successfully loaded Copyright Info: \(copyrightInfo.text ?? "Unknown")")
        } catch {
            print("\n!! Failed to load Copyright Info: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
