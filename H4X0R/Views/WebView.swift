//
//  WebView.swift
//  H4X0R
//
//  Created by Jeff Patterson on 11/17/24.
//

import SwiftUI
import WebKit
import Foundation

struct WebView: UIViewRepresentable {
    let urlSting: String?
   
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlSting {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
