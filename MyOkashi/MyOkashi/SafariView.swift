//
//  SafariView.swift
//  MyOkashi
//
//  Created by 工藤貴央 on 2021/05/04.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable{
    var url: URL
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url:url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}
