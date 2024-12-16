import Foundation

enum DayPart: CaseIterable {
    case morning    // 06:00–12:00
    case daytime    // 12:00–18:00
    case evening    // 18:00–00:00
    case night      // 00:00–06:00
}

struct Filters {
    var dayParts: Set<DayPart>
    var showTransfers: Bool?
}
