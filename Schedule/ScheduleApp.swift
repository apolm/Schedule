import SwiftUI
import SDWebImage
import SDWebImageSVGKitPlugin

@main
struct ScheduleApp: App {
    @StateObject private var appSettings = AppSettings()
    
    init() {
        UITabBar.setCustomAppearance(backgroundColor: .ypWhite, shadowColor: .ypGrayDark)
        SDImageCodersManager.shared.addCoder(SDImageSVGKCoder.shared)
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(appSettings)
                .preferredColorScheme(appSettings.isDarkMode ? .dark : .light)
        }
    }
}
