import UIKit

extension UITabBar {
    static func setCustomAppearance(backgroundColor: UIColor, shadowColor: UIColor) {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = backgroundColor
        appearance.shadowColor = shadowColor
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}
