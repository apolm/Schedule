import SwiftUI

struct DayPartCheckRow: View {
    let text: String
    let dayPart: DayPart
    @Binding var selectedDayParts: Set<DayPart>
    
    var isChecked: Bool {
        selectedDayParts.contains(dayPart)
    }
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(.ypBlack)
            
            Spacer()
            
            Button {
                if isChecked {
                    selectedDayParts.remove(dayPart)
                } else {
                    selectedDayParts.insert(dayPart)
                }
            } label: {
                Image(isChecked ? Assets.checkBoxOn : Assets.checkBoxOff)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    VStack {
        DayPartCheckRow(
            text: "Утро 06:00 – 12:00",
            dayPart: .morning,
            selectedDayParts: .constant(
                Set<DayPart>()
            )
        )
        
        DayPartCheckRow(
            text: "Утро 06:00 – 12:00",
            dayPart: .morning,
            selectedDayParts: .constant(
                Set(
                    [DayPart.morning]
                )
            )
        )
    }
    .padding(16)
}
