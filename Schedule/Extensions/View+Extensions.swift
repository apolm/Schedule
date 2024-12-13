import SwiftUI

extension View {
    func navigationToolbar(title: String, presentationMode: Binding<PresentationMode>) -> some View {
        self.navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(.ypBlack)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(Assets.chevronLeft)
                            .renderingMode(.template)
                    }
                }
            }
    }
}
