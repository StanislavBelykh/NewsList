//
//  WebView.swift
//  NewsAPIListing
//
//  Created by Полина on 16.01.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: Context) -> WKWebView  {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {

    }

}
