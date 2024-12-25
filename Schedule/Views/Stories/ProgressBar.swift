import SwiftUI

struct ProgressBar: View {
    let numberOfSections: Int
    let progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: ProgressBarConstants.progressBarCornerRadius)
                    .frame(width: geometry.size.width, height: ProgressBarConstants.progressBarHeight)
                    .foregroundColor(.white)
                
                RoundedRectangle(cornerRadius: ProgressBarConstants.progressBarCornerRadius)
                    .frame(
                        width: min(
                            progress * geometry.size.width,
                            geometry.size.width
                        ),
                        height: ProgressBarConstants.progressBarHeight
                    )
                    .foregroundColor(.ypBlue)
            }
            .mask {
                MaskView(numberOfSections: numberOfSections)
            }
        }
        .frame(height: ProgressBarConstants.progressBarHeight)
    }
}

private struct ProgressBarConstants {
    static let progressBarCornerRadius: CGFloat = 6
    static let progressBarHeight: CGFloat = 6
}

private struct MaskView: View {
    let numberOfSections: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfSections, id: \.self) { _ in
                MaskFragmentView()
            }
        }
    }
}

private struct MaskFragmentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: ProgressBarConstants.progressBarCornerRadius)
            .fixedSize(horizontal: false, vertical: true)
            .frame(height: ProgressBarConstants.progressBarHeight)
            .foregroundStyle(.white)
    }
}

#Preview {
    Color.ypBlackUniversal
        .ignoresSafeArea()
        .overlay(
            ProgressBar(numberOfSections: 5, progress: 0.5)
                .padding()
        )
}
