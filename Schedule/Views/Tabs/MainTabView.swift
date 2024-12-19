import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ScheduleTabView()
                .tabItem {
                    Image(Assets.tabSchedule)
                        .renderingMode(.template)
                        .foregroundStyle(.ypBlack)
                }
            
            SettingsTabView()
                .tabItem {
                    Image(Assets.tabSettings)
                        .renderingMode(.template)
                        .foregroundStyle(.ypBlack)
                }
        }
        .tint(.ypBlack)
    }
}

#Preview {
    MainTabView()
}
