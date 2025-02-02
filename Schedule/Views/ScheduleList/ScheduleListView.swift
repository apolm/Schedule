import SwiftUI

struct ScheduleListView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ScheduleListViewModel
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if viewModel.loadingFailed {
                    ErrorView(errorType: .serverError)
                } else {
                    VStack(spacing: 16) {
                        Text(viewModel.title)
                            .titleTextStyle()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack {
                            StubView(message: "Вариантов нет")
                                .hidden(!viewModel.filteredRoutes.isEmpty)
                            
                            List {
                                ForEach(viewModel.filteredRoutes) { route in
                                    Button {
                                        path.append(route.carrier)
                                    } label: {
                                        RouteView(route: route)
                                            .listRowSeparator(.hidden)
                                            .listRowInsets(EdgeInsets())
                                    }
                                    .buttonStyle(.plain)
                                    .listRowSeparator(.hidden)
                                    .listRowInsets(EdgeInsets())
                                }
                            }
                            .listStyle(.plain)
                            .listRowSpacing(8)
                            .hidden(viewModel.filteredRoutes.isEmpty)
                            
                            VStack {
                                Spacer()
                                
                                Button {
                                    path.append("Filters")
                                } label: {
                                    HStack(spacing: 4) {
                                        Text("Уточнить время")
                                            .bold()
                                            .foregroundStyle(.ypWhiteUniversal)
                                        
                                        if !viewModel.filters.isEmpty {
                                            Circle()
                                                .fill(Color.ypRed)
                                                .frame(width: 8, height: 8)
                                        }
                                    }
                                    .padding(.vertical, 20)
                                    .frame(maxWidth: .infinity)
                                    .background(.ypBlue)
                                    .cornerRadius(16)
                                }
                            }
                        }
                    }
                    .padding(16)
                }
            }
            .background(.ypWhite)
            .task {
                await viewModel.fetchRoutes()
            }
            .navigationToolbar(title: nil, presentationMode: presentationMode)
            .navigationDestination(for: String.self) { value in
                if value == "Filters" {
                    FiltersView(initialFilters: viewModel.filters) { newFilters in
                        viewModel.applyFilters(value: newFilters)
                    }
                }
            }
            .navigationDestination(for: Carrier.self) { carrier in
                CarrierView(viewModel: CarrierViewModel(carrier: carrier))
            }
        }
    }
}
