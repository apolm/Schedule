import SwiftUI

struct SearchFieldView: View {
    @Binding var searchText: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.ypGrayUniversal)
            
            TextField("", text: $searchText)
                .focused($isFocused)
                .autocorrectionDisabled()
                .baseTextStyle()
                .placeholder(when: searchText.isEmpty) {
                    Text("Введите запрос")
                        .foregroundStyle(.ypGrayUniversal)
                }
            
            if isFocused {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.ypGrayUniversal)
                }
            }
        }
        .padding(8)
        .background(Color(.ypLightGray))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow {
                placeholder()
            }
            self
        }
    }
}

#Preview {
    SearchFieldView(searchText: .constant(""))
}
