import SwiftUI

enum ErrorType {
    case serverError
    case connectionError

    var imageName: String {
        switch self {
        case .serverError:
            return Assets.serverError
        case .connectionError:
            return Assets.connectionError
        }
    }

    var errorMessage: String {
        switch self {
        case .serverError:
            return "Ошибка сервера"
        case .connectionError:
            return "Нет интернета"
        }
    }
}

struct ErrorView: View {
    var errorType: ErrorType
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Image(errorType.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 223, height: 223)
            
            Text(errorType.errorMessage)
                .titleTextStyle()
            
            Spacer()
        }
        .padding()
        .background(.ypWhite)
    }
}

#Preview {
    Group {
        ErrorView(errorType: .serverError)
        ErrorView(errorType: .connectionError)
    }
}
