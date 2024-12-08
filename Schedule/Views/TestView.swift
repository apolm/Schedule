import SwiftUI

struct TestView: View {
    @State private var fromText = ""
    @State private var toText = ""
    
    var body: some View {
        HStack(spacing: 16) {
            
            VStack(spacing: 0) {
                TextField("Откуда", text: $fromText)
                    .padding(14)
                    .background(Color.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                
                TextField("Куда", text: $fromText)
                    .padding(14)
                    .background(Color.white)
                    .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
            }
            
            Button(action: {
                // Button action here
            }) {
                Image(Assets.changeDirection)
                    .frame(width: 36, height: 36)
                    .background(Color.white)
                    .clipShape(Circle())
            }
        }
        .padding(16)
        .background(Color.blue) 
        .cornerRadius(20)
            
    }
}

#Preview {
    TestView()
        .padding()
        .previewLayout(.sizeThatFits)
}
