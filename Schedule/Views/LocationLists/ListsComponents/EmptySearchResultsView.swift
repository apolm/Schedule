import SwiftUI

struct EmptySearchResultsView: View {
    let message: String
    
    var body: some View {
        Spacer()
        
        Text(message)
            .font(.system(size: 24, weight: .bold))
            .padding()
                
        Spacer()
    }
}

#Preview {
    EmptySearchResultsView(message: "No results found")
}