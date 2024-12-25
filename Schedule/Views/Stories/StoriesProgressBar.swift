import SwiftUI
import Combine

struct StoriesProgressBar: View {
    @Environment(\.dismiss) var dismiss
    @Binding var currentProgress: CGFloat
    
    let storiesCount: Int
    let timerConfiguration: TimerConfiguration
    
    private let timer: AnyPublisher<Date, Never>
    
    init(storiesCount: Int, timerConfiguration: TimerConfiguration, currentProgress: Binding<CGFloat>) {
        self.storiesCount = storiesCount
        self.timerConfiguration = timerConfiguration
        self._currentProgress = currentProgress
        self.timer = Timer.publish(every: timerConfiguration.timerTickInternal, on: .main, in: .common)
            .autoconnect()
            .eraseToAnyPublisher()
    }

    var body: some View {
        VStack {
            ProgressBar(numberOfSections: storiesCount, progress: currentProgress)
                .onReceive(timer) { _ in
                    timerTick()
                }
        }
    }
    
    private func timerTick() {
        let nextProgress = timerConfiguration.nextProgress(progress: currentProgress)
        if nextProgress > 1 {
            dismiss()
        } else {
            withAnimation {
                currentProgress = nextProgress
            }
        }
    }
}

extension StoriesProgressBar {
    private static func makeTimer(configuration: TimerConfiguration) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}
