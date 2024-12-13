import SwiftUI

struct TestView: View {
    @State private var fromText = ""
    @State private var toText = ""
    
    var body: some View {
        Text("Test")
            
    }
}

#Preview {
    TestView()
        .padding()
        .previewLayout(.sizeThatFits)
}
