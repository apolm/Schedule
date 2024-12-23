import SwiftUI

struct StoriesGroup: Identifiable {
    let id: String
    let title: String
    let image: UIImage
    let stories: [Story]
}

extension StoriesGroup {
    static let mockStories: [StoriesGroup] = {
        let repeatedText = Array(repeating: "Text", count: 30).joined(separator: " ")
        
        return (1...9).compactMap { groupIndex in
            guard let groupImage = UIImage(named: "Preview_\(groupIndex)") else { return nil }
            
            let stories = (1...2).compactMap { storyIndex -> Story? in
                guard let storyImage = UIImage(named: "Story_\(groupIndex)_\(storyIndex)") else {
                    return nil
                }
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
