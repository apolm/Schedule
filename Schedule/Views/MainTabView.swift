import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Color.ypWhite
                .tabItem {
                    Image(Assets.tabSchedule)
                        .renderingMode(.template)
                }
            
            Color.orange
                .tabItem {
                    Image(Assets.tabSettings)
                        .renderingMode(.template)
                }
        }
        .tint(.ypBlack)
    }
}

#Preview {
    MainTabView()
}
