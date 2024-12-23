import SwiftUI

final class StoriesGroupViewModel: ObservableObject {
    @Published var groups: [StoriesGroup] = []
    @Published var seenGroupIDs: Set<String> = []
    @AppStorage("seenGroupIDs") private var seenGroupIDsData: String = ""
    
    init() {
        loadMockData()
        loadSeenStatus()
    }
    
    private func loadMockData() {
        self.groups = StoriesGroup.mockStories
    }
    
    private func loadSeenStatus() {
        let idsArray = seenGroupIDsData.split(separator: ",").map { String($0) }
        self.seenGroupIDs = Set(idsArray)
    }
    
    func markAsSeen(group: StoriesGroup) {
        seenGroupIDs.insert(group.id)
        saveSeenStatus()
    }
    
    func hasSeen(group: StoriesGroup) -> Bool {
        return seenGroupIDs.contains(group.id)
    }
    
    private func saveSeenStatus() {
        seenGroupIDsData = seenGroupIDs.joined(separator: ",")
    }
}
