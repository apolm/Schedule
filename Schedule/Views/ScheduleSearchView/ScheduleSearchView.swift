import SwiftUI

struct ScheduleSearchView: View {
    @StateObject var viewModel: ScheduleSearchViewModel
    @StateObject private var fromViewModel = DestinationViewModel()
    @StateObject private var toViewModel = DestinationViewModel()
    
    @State private var fromText: String = ""
    
    var body: some View {
        HStack(spacing: 16) {
            VStack(spacing: 0) {
                DestinationView(viewModel: fromViewModel, placeholder: "Откуда")
                DestinationView(viewModel: toViewModel, placeholder: "Куда")
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Button(action: {
                // TODO Button action here
            }) {
                Image(Assets.changeDirection)
                    .frame(width: 36, height: 36)
                    .background(.ypWhiteUniversal)
                    .clipShape(Circle())
            }
        }
        .padding(16)
        .background(.ypBlue)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ScheduleSearchView(viewModel: ScheduleSearchViewModel())
        .padding()
        .previewLayout(.sizeThatFits)
}
