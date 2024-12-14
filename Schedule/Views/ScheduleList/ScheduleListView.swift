import SwiftUI

struct ScheduleListView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: ScheduleListViewModel
    @State private var path = NavigationPath()
    
    var body: some View {
            NavigationStack(path: $path) {
                VStack(spacing: 16) {
                    Text(viewModel.title)
                        .titleTextStyle()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    Text("Schedule List")
                    Spacer()
                }
                .padding(16)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .renderingMode(.template)
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
        }
}
