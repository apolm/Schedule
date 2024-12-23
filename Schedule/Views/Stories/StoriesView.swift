import SwiftUI

struct StoriesView: View {
    @Environment(\.dismiss) var dismiss
    let stories: [Story]
    
    var body: some View {
        ZStack {
            Color.ypRed.ignoresSafeArea()
            
            Text("Stories")
                .onTapGesture {
                    dismiss()
                }
        }
    }
}

#Preview {
    StoriesView(stories: StoriesGroup.mockStories.first?.stories ?? [])
}
