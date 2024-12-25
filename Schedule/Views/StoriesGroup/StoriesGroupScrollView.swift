import SwiftUI

struct StoriesGroupScrollView: View {
    @StateObject private var viewModel = StoriesGroupViewModel()
    @State private var selectedGroup: StoriesGroup? = nil
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.groups) { group in
                    ZStack {
                        group.image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 92, height: 140)
                            .clipped()
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.blue, lineWidth: 4)
                                    .hidden(viewModel.hasSeen(group: group))
                            )
                            .overlay(alignment: .bottom) {
                                Text(group.title)
                                    .font(.system(size: 12))
                                    .foregroundStyle(.ypWhiteUniversal)
                                    .padding(.horizontal, 8)
                                    .padding(.bottom, 12)
                                    .lineLimit(3)
                            }
                            .padding(.vertical, 2)
                            .opacity(viewModel.hasSeen(group: group) ? 0.5 : 1.0)
                            .onTapGesture {
                                selectedGroup = group
                            }
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .fullScreenCover(item: $selectedGroup) { group in
            StoriesView(stories: group.stories)
                .onDisappear {
                    viewModel.markAsSeen(group: group)
                }
        }
    }
}

#Preview {
    StoriesGroupScrollView()
}
