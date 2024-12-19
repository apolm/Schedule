import SwiftUI

struct RadioRow<T: Equatable>: View {
    let text: String
    @Binding var selection: T?
    let tag: T
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(.ypBlack)
            
            Spacer()
            
            Button {
                if selection == tag {
                    selection = nil
                } else {
                    selection = tag
                }
            } label: {
                Image(selection == tag ? Assets.radioButtonOn : Assets.radioButtonOff)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    VStack {
        RadioRow(text: "Да", selection: .constant(true), tag: true)
        RadioRow(text: "Нет", selection: .constant(false), tag: false)
    }
    .padding(16)
}
