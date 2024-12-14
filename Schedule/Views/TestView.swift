import SwiftUI

struct TestView: View {
    @State private var fromText = ""
    @State private var toText = ""
    
    var body: some View {
        Button(action: {
            // Perform your search action here
        }) {
            Text("Найти")
                .font(.body)
                .bold()
                .foregroundStyle(.ypWhiteUniversal)
                .padding(.horizontal, 47.5)
                .padding(.vertical, 20)
                .background(Color.ypBlue)
                .cornerRadius(16)
        }
        
    }
}

#Preview {
    TestView()
        .padding()
        .previewLayout(.sizeThatFits)
}
