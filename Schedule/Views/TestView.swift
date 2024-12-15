import SwiftUI

struct TestView: View {
    let route: Route
    
    private var formattedDate: String {
        DateFormatterProvider.shared.dateFormatter.string(from: route.date)
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Rectangle()
            //.fill(Color.clear)
                .fill(Color.orange)
                .frame(width: 38, height: 38)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 2) {
                Text("France")
                    .font(.system(size: 17))
                    .foregroundStyle(.ypBlackUniversal)
            }
            
            Spacer()
            
            VStack {
                Text(formattedDate)
                    .font(.system(size: 12))
                    .foregroundStyle(.ypBlackUniversal)
                Text("")
            }
        }
        .background(.ypGrayUniversal)
    }
}

#Preview {
    TestView(route: MockDataProvider.mockRoute1)
        .previewLayout(.sizeThatFits)
        .padding(.horizontal, 50)
}
