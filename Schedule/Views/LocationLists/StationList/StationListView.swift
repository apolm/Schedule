import SwiftUI

struct StationListView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: StationListViewModel
    var onStationSelected: (Station) -> Void
    
    var body: some View {
        VStack {
            List(viewModel.stations) { station in
                Button(action: {
                    onStationSelected(station)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text(station.title)
                }
            }
        }
        .navigationToolbar(title: "Выбор станции", presentationMode: presentationMode)
    }
}
