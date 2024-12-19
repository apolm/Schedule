import SwiftUI

struct UserAgreementView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var isLoading = false
    private let url = URL(string: "https://yandex.ru/legal/practicum_offer/")
    
    var body: some View {
        NavigationStack {
            ZStack {
                if let url = url {
                    WebView(url: url, isLoading: $isLoading, isDarkMode: colorScheme == .dark)
                } else {
                    Text("Invalid URL")
                }
                
                if isLoading {
                    ProgressView()
                }
            }
            .ignoresSafeArea(edges: .bottom)
            .background(.ypWhite)
            .navigationToolbar(title: "Пользовательское соглашение", presentationMode: presentationMode)
        }
    }
}
