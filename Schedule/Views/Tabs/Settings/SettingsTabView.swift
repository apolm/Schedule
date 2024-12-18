import SwiftUI

struct SettingsTabView: View {
    @State private var isDarkMode = false
    @State private var showUserAgreement = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                HStack {
                    Text("Темная тема")
                        .foregroundColor(.ypBlack)
                    Spacer()
                    Toggle("", isOn: $isDarkMode)
                        .labelsHidden()
                        .tint(.ypBlue)
                }
                                
                Button(action: {
                    showUserAgreement = true
                }) {
                    HStack {
                        Text("Пользовательское соглашение")
                            .foregroundColor(.ypBlack)
                        Spacer()
                        Image(Assets.chevron)
                            .renderingMode(.template)
                            .foregroundStyle(.ypBlack)
                    }
                }
                
                Spacer()
                
                VStack(spacing: 16) {
                    Text("Приложение использует API «Яндекс.Расписания»")
                    Text("Версия \(Constants.appVersion)")
                }
                .font(.caption)
                .foregroundStyle(.ypBlack)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
            .fullScreenCover(isPresented: $showUserAgreement) {
                UserAgreementView()
                    //.ignoresSafeArea()
            }
        }
    }
}

#Preview {
    SettingsTabView()
}