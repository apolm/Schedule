import SwiftUI

struct FiltersView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var dayParts: Set<DayPart>
    @State private var showTransfers: Bool?
    
    let initialFilters: Filters
    let onApply: (Filters) -> Void
    
    private var isAnyFilterSelected: Bool {
        !dayParts.isEmpty || showTransfers != nil
    }
    
    private var selectedFilters: Filters {
        Filters(dayParts: dayParts, showTransfers: showTransfers)
    }
    
    init(initialFilters: Filters, onApply: @escaping (Filters) -> Void) {
        self.initialFilters = initialFilters
        self.onApply = onApply
        _dayParts = State(initialValue: initialFilters.dayParts)
        _showTransfers = State(initialValue: initialFilters.showTransfers)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Время отправления")
                .titleTextStyle()
            
            VStack(alignment: .leading, spacing: 12) {
                DayPartCheckRow(text: "Утро 06:00 – 12:00", dayPart: .morning, selectedDayParts: $dayParts)
                DayPartCheckRow(text: "День 12:00 – 18:00", dayPart: .daytime, selectedDayParts: $dayParts)
                DayPartCheckRow(text: "Вечер 18:00 – 00:00", dayPart: .evening, selectedDayParts: $dayParts)
                DayPartCheckRow(text: "Ночь 00:00 – 06:00", dayPart: .night, selectedDayParts: $dayParts)
            }
            
            Text("Показывать варианты с пересадками")
                .titleTextStyle()
            
            VStack(alignment: .leading, spacing: 12) {
                RadioRow(text: "Да", selection: $showTransfers, tag: true)
                RadioRow(text: "Нет", selection: $showTransfers, tag: false)
            }
            
            Spacer()
            
            if isAnyFilterSelected {
                Button {
                    onApply(selectedFilters)
                } label: {
                    Text("Применить")
                        .bold()
                        .foregroundStyle(.ypWhiteUniversal)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(.ypBlue)
                        .cornerRadius(16)
                }
            }
        }
        .padding(16)
        .navigationToolbar(title: nil, presentationMode: presentationMode)
    }
}

#Preview {
    FiltersView(initialFilters: Filters(dayParts: Set<DayPart>())) { _ in }
}
