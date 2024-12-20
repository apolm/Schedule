import SwiftUI

struct CarrierView: View {
    @Environment(\.presentationMode) var presentationMode
    let carrier: Carrier
    
    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: carrier.logoFull)) { image in
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
                Text(carrier.title)
                    .titleTextStyle()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("E-mail")
                        .foregroundStyle(.ypBlack)
                    
                    Text(carrier.email ?? "-")
                        .font(.caption)
                        .foregroundStyle(.ypBlue)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Телефон")
                        .foregroundStyle(.ypBlack)
                    
                    Text(carrier.phone ?? "-")
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
    CarrierView(carrier: MockDataProvider.carrier)
}
