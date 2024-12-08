import SwiftUI

@main
struct ScheduleApp: App {
    init() {
        UITabBar.setCustomAppearance(backgroundColor: .ypWhite, shadowColor: UIColor.ypGrayDark)
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
