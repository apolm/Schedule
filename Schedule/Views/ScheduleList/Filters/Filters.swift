import Foundation

struct Filters {
    var dayParts: Set<DayPart>
    var showTransfers: Bool?
    
    var isEmpty: Bool {
        dayParts.isEmpty && showTransfers == nil
    }
    
    init(dayParts: Set<DayPart>, showTransfers: Bool? = nil) {
        self.dayParts = dayParts
        self.showTransfers = showTransfers
    }
    
    init() {
        self.dayParts = Set()
    }
}
