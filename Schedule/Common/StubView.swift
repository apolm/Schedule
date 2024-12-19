import SwiftUI

struct StubView: View {
    let message: String
    
    var body: some View {
        Spacer()
        
        Text(message)
            .titleTextStyle()
            .padding()
                
        Spacer()
    }
}

#Preview {
    StubView(message: "No results found")
}
