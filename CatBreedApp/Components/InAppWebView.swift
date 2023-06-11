//
//  InAppWebView.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 11.06.2023.
//

import SwiftUI
import WebKit

struct InAppWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
