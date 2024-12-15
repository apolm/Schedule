import SwiftUI
import SDWebImage
import SDWebImageSVGKitPlugin

@main
struct ScheduleApp: App {
    init() {
        UITabBar.setCustomAppearance(backgroundColor: .ypWhite, shadowColor: .ypGrayDark)
        SDImageCodersManager.shared.addCoder(SDImageSVGKCoder.shared)
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
