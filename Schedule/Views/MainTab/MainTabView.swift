import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            VStack {
                ScheduleSearchView(viewModel: ScheduleSearchViewModel())
                    .padding(16)
                
                Spacer()
            }
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
