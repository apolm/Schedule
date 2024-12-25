import SwiftUI

struct StoriesView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentStoryIndex: Int = 0
    @State private var currentProgress: CGFloat = 0
    
    let stories: [Story]
    
    private var timerConfiguration: TimerConfiguration { .init(storiesCount: stories.count) }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoriesTabView(stories: stories, currentStoryIndex: $currentStoryIndex)
                .onChange(of: currentStoryIndex) { newIndex in
                    didChangeCurrentIndex(newIndex: newIndex)
                }
            
            VStack(alignment: .trailing, spacing: 0) {
                StoriesProgressBar(
                    storiesCount: stories.count,
                    timerConfiguration: timerConfiguration,
                    currentProgress: $currentProgress
                )
                .padding(.init(top: 28, leading: 12, bottom: 16, trailing: 12))
                .onChange(of: currentProgress) { newValue in
                    didChangeCurrentProgress(newProgress: newValue)
                }
                
                Button {
                    dismiss()
                } label: {
                    Image(.close)
                }
                .padding(.trailing, 12)
            }
        }
        .preferredColorScheme(.dark)
    }
    
    private func didChangeCurrentIndex(newIndex: Int) {
        let progress = timerConfiguration.progress(for: newIndex)
        guard abs(progress - currentProgress) >= 0.01 else { return }
        withAnimation {
            currentProgress = progress
        }
    }

    private func didChangeCurrentProgress(newProgress: CGFloat) {
        let index = timerConfiguration.index(for: newProgress)
        guard index != currentStoryIndex else { return }
        withAnimation {
            currentStoryIndex = index
        }
    }
}

#Preview {
    StoriesView(stories: StoriesGroup.mockStories.first?.stories ?? [])
}
