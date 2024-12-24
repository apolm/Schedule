import SwiftUI

struct StoriesTabView: View {
    let stories: [Story]
    @Binding var currentStoryIndex: Int
    
    var body: some View {
        ZStack {
            Color.ypBlackUniversal
                .ignoresSafeArea()
            
            TabView(selection: $currentStoryIndex) {
                ForEach(stories.indices, id: \.self) { index in
                    ZStack {
                        StoryView(story: stories[index])
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        HStack(spacing: 0) {
                            Color.clear
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    didTapLeft()
                                }
                            
                            Color.clear
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    didTapRight()
                                }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    
    }
    
    func didTapStory() {
        let isLastStory = (currentStoryIndex == stories.count - 1)
        if !isLastStory {
            currentStoryIndex = currentStoryIndex + 1
        }
    }
    
    private func didTapLeft() {
        let isFirstStory = (currentStoryIndex == 0)
        if !isFirstStory {
            currentStoryIndex = currentStoryIndex - 1
        }
    }
    
    private func didTapRight() {
        let isLastStory = (currentStoryIndex == stories.count - 1)
        if !isLastStory {
            currentStoryIndex = currentStoryIndex + 1
        }
    }
}

#Preview {
    @State var currentStoryIndex = 0
    return StoriesTabView(stories: StoriesGroup.mockStories[5].stories, currentStoryIndex: $currentStoryIndex)
}
