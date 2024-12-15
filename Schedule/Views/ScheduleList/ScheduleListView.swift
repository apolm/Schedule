import SwiftUI

struct ScheduleListView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: ScheduleListViewModel
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if viewModel.loadingFailed {
                    Text("error").foregroundStyle(.red) // TODO - Show error View
                } else {
                    VStack(spacing: 16) {
                        Text(viewModel.title)
                            .titleTextStyle()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        List {
                            ForEach(viewModel.routes) { route in
                                RouteView(route: route)
                                    .listRowSeparator(.hidden)
                                    .listRowInsets(EdgeInsets())
                            }
                        }
                        .listStyle(.plain)
                        .listRowSpacing(8)
                    }
                    .padding(16)
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchRoutes()
                }
            }
            .navigationToolbar(title: nil, presentationMode: presentationMode)
        }
    }
}
