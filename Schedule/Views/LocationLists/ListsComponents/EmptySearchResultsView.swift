import SwiftUI

struct EmptySearchResultsView: View {
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
    EmptySearchResultsView(message: "No results found")
}
