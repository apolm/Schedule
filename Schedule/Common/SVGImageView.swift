import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSVGKitPlugin

struct SVGImageView: View {
    let svgURL: URL?
    
    var body: some View {
        WebImage(url: svgURL) { image in
            image
                .resizable()
        }  placeholder: {
            Rectangle()
                .fill(Color.clear)
        }
        .aspectRatio(contentMode: .fit)
    }
}
