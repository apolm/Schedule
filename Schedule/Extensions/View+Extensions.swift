import SwiftUI

extension View {
    func navigationToolbar(title: String, presentationMode: Binding<PresentationMode>) -> some View {
        self.navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundStyle(.ypBlack)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(Assets.chevronLeft)
                            .renderingMode(.template)
                            .foregroundStyle(.ypBlack)
                    }
                }
            }
    }
}
