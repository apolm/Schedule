import SwiftUI

struct StoriesGroup: Identifiable {
    let id: String
    let title: String
    let image: Image
    let stories: [Story]
}

extension StoriesGroup {
    static let mockStories: [StoriesGroup] = {
        let repeatedText = Array(repeating: "Text", count: 30).joined(separator: " ")
        
        return (1...9).compactMap { groupIndex in
            let groupImage = Image("Preview_\(groupIndex)")
            
            let stories = (1...2).compactMap { storyIndex -> Story? in
                let storyImage = Image("Story_\(groupIndex)_\(storyIndex)")
                
                return Story(
                    id: "Story_\(groupIndex)_\(storyIndex)",
                    title: repeatedText,
                    description: repeatedText,
                    image: storyImage
                )
            }
            
            guard !stories.isEmpty else { return nil }
            
            return StoriesGroup(
                id: "Group_\(groupIndex)",
                title: repeatedText,
                image: groupImage,
                stories: stories
            )
        }
    }()
}
