import SwiftUI

struct CarrierView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: CarrierViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: viewModel.logoURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200)
            } placeholder: {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            .padding(16)
            
            VStack(alignment: .leading, spacing: 28) {
                Text(viewModel.title)
                    .titleTextStyle()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("E-mail")
                        .foregroundStyle(.ypBlack)
                    
                    Text(viewModel.email)
                        .font(.caption)
                        .foregroundStyle(.ypBlue)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Телефон")
                        .foregroundStyle(.ypBlack)
                    
                    Text(viewModel.phone)
                        .font(.caption)
                        .foregroundStyle(.ypBlue)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding(16)
        .background(.ypWhite)
        .navigationToolbar(title: "Информация о перевозчике", presentationMode: presentationMode)
    }
}

#Preview {
    CarrierView(viewModel: CarrierViewModel(carrier: MockDataProvider.carrier))
}
