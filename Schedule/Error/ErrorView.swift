import SwiftUI

enum ErrorType {
    case serverError
    case connectionError
}

struct ErrorView: View {
    var errorType: ErrorType
    
    private var imageName: String {
        switch errorType {
        case .serverError:
            return Assets.serverError
        case .connectionError:
            return Assets.connectionError
        }
    }
    
    private var errorMessage: String {
        switch errorType {
        case .serverError:
            return "Ошибка сервера"
        case .connectionError:
            return "Нет интернета"
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 223, height: 223)
            
            Text(errorMessage)
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
