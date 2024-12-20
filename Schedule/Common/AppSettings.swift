import SwiftUI

final class AppSettings: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
}
