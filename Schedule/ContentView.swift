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
            do { try stations() } catch {
                print("Failed to load Stations: \(error.localizedDescription)")
            }
        }
    }
}

extension ContentView {
    func stations() throws {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = NearestStationsService(client: client)
        
        Task {
            let stations = try await service.getNearestStations(
                lat: 59.864177,
                lng: 30.319163,
                distance: 50
            )
            print("Successfully loaded Stations (\(stations.stations?.count ?? 0))")
        }
    }
}

#Preview {
    ContentView()
}
