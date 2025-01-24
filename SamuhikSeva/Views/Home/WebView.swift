//
//  WebView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 24/01/25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let embedUrl: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.allowsBackForwardNavigationGestures = false // Disable navigation gestures
        webView.scrollView.isScrollEnabled = false // Disable scrolling
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: embedUrl) else { return }
        uiView.load(URLRequest(url: url))
    }
}
