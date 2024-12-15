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
                        
                        Spacer()
                        Text("Schedule List")
                        Spacer()
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
