//
//  ActivityView.swift
//  MyCamera
//
//  Created by 工藤貴央 on 2021/05/04.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    let shareItems:[Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {        
    }
}
