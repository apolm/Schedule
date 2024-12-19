import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    @Binding var isLoading: Bool
    var isDarkMode: Bool
    
    private static let css = """
        html, body, * {
          background-color: #1C1C1E !important;
          color: #FFFFFF !important;
          border-color: #FFFFFF !important;
        }
        a { color: #9FCFFF !important; }
    """
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, isDarkMode: isDarkMode)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        if isDarkMode {
            let script = WKUserScript(
                source: WebView.css,
                injectionTime: .atDocumentStart,
                forMainFrameOnly: true
            )
            webView.configuration.userContentController.addUserScript(script)
        }
        
        webView.isOpaque = false
        webView.backgroundColor = .systemBackground
        webView.scrollView.backgroundColor = .systemBackground
        
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        var isDarkMode: Bool
        
        init(_ parent: WebView, isDarkMode: Bool) {
            self.parent = parent
            self.isDarkMode = isDarkMode
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
            
            if isDarkMode {
                let jsAddStyle = """
                    var style = document.createElement('style');
                    style.innerText = `\(WebView.css)`;
                    document.head.appendChild(style);
                """
                
                webView.evaluateJavaScript(jsAddStyle, completionHandler: nil)
            }
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.isLoading = false
        }
    }
}
