import SwiftUI

struct StoryView: View {
    let story: Story
    
    var body: some View {
        ZStack {
            Color.ypBlackUniversal
            
            story.image
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .overlay(
                    VStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 16) {
                            Text(story.title)
                                .font(.system(size: 34, weight: .bold))
                                .lineLimit(2)
                                .foregroundColor(.ypWhiteUniversal)
                            Text(story.description)
                                .font(.system(size: 20))
                                .lineLimit(3)
                                .foregroundColor(.ypWhiteUniversal)
                        }
                        .padding(.init(top: 0, leading: 16, bottom: 40, trailing: 16))
                    }
                )
        }
    }
}

#Preview {
    StoryView(
        story: StoriesGroup.mockStories[5].stories[0]
    )
}
