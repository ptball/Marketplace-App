import SwiftUI
import WebKit

struct MarketplaceWebView: UIViewRepresentable {
    @Binding var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        
        // Set user agent to appear as mobile Safari
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Mobile/15E148 Safari/604.1"
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: MarketplaceWebView
        
        init(_ parent: MarketplaceWebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            // Only allow Facebook Marketplace URLs
            if let url = navigationAction.request.url {
                let urlString = url.absoluteString
                
                // Allow Facebook login and marketplace
                if urlString.contains("facebook.com/marketplace") ||
                   urlString.contains("facebook.com/login") ||
                   urlString.contains("facebook.com/checkpoint") ||
                   urlString.contains("m.facebook.com") {
                    decisionHandler(.allow)
                    return
                }
                
                // Block non-marketplace Facebook pages
                if urlString.contains("facebook.com") && !urlString.contains("marketplace") {
                    decisionHandler(.cancel)
                    return
                }
            }
            
            decisionHandler(.allow)
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Inject CSS to hide non-marketplace elements
            let css = """
            /* Hide Facebook navigation except marketplace */
            [role="banner"] { display: none !important; }
            [role="navigation"]:not([aria-label*="Marketplace"]) { display: none !important; }
            /* Keep marketplace content visible */
            [aria-label*="Marketplace"] { display: block !important; }
            """
            
            let script = """
            var style = document.createElement('style');
            style.innerHTML = `\(css)`;
            document.head.appendChild(style);
            """
            
            webView.evaluateJavaScript(script, completionHandler: nil)
        }
    }
}
