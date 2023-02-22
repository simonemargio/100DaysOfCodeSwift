//
//  DetailView.swift
//  H4X0R
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        // Create a web view with the url passed
        WebView(urlString: url)
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://simonemargio.im")
    }
}

// Create the web view
struct WebView: UIViewRepresentable {
    
    let urlString: String?
   
    // When body call WebView this func create the web view and
    // next call updateUIView that loading the url
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
     
}
