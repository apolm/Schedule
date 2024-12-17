import SwiftUI

struct RouteView: View {
    let route: Route
    
    var body: some View {
        VStack(spacing: 18) {
            TopRow(route: route)
            BottomRow(route: route)
        }
        .padding(14)
        .background(.ypLightGrayUniversal)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

struct TopRow: View {
    let route: Route
    
    private var formattedDate: String {
        DateFormatterProvider.shared.dateFormatter.string(from: route.date)
    }
    
    var body: some View {
        HStack(spacing: 8) {
            SVGImageView(svgURL: URL(string: route.carrier.logoSVG))
                .frame(width: 38, height: 38)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(route.carrier.title)
                    .font(.system(size: 17))
                    .foregroundStyle(.ypBlackUniversal)
                
                if route.hasTransfers, let transferPoint = route.transferPoint {
                    Text("С пересадкой в \(transferPoint)")
                        .font(.system(size: 12))
                        .foregroundColor(.ypRed)
                }
            }
            
            Spacer()
            
            Text(formattedDate)
                .font(.system(size: 12))
                .foregroundStyle(.ypBlackUniversal)
        }
    }
}

struct BottomRow: View {
    let route: Route
    
    private func formattedTime(from date: Date) -> String {
        DateFormatterProvider.shared.timeFormatter.string(from: date)
    }
    
    private var formattedDuration: String {
        let hours = route.durationSeconds / 3600
        let minutes = (route.durationSeconds % 3600) / 60
        
        if hours >= 1 {
            return "\(hours) часов"
        } else {
            return "\(minutes) минут"
        }
    }
    
    var body: some View {
        HStack {
            Text(formattedTime(from: route.departure))
                .font(.system(size: 17))
                .foregroundStyle(.ypBlackUniversal)
            
            Rectangle()
                .fill(Color.ypGrayUniversal)
                .frame(height: 1)
                .padding(.horizontal, 4)
            
            Text(formattedDuration)
                .font(.system(size: 12))
                .foregroundStyle(.ypBlackUniversal)
            
            Rectangle()
                .fill(Color.ypGrayUniversal)
                .frame(height: 1)
                .padding(.horizontal, 4)
            
            Text(formattedTime(from: route.arrival))
                .font(.system(size: 17))
                .foregroundStyle(.ypBlackUniversal)
        }
    }
}

#Preview {
    RouteView(route: MockDataProvider.mockRoute1)
        .previewLayout(.sizeThatFits)
}
