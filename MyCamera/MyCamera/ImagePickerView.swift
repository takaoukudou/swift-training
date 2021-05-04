//
//  ImagePickerView.swift
//  MyCamera
//
//  Created by 工藤貴央 on 2021/05/04.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var isShowSheet: Bool
    @Binding var captureImage:UIImage?
    
    class Coordinator: NSObject,
                        UINavigationControllerDelegate,
                        UIImagePickerControllerDelegate{
        let parent : ImagePickerView
        init(_ parent: ImagePickerView){
            self.parent = parent
        }
        
        //撮影終了後に呼ばれる
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey:Any]){
            
            //撮影した写真を保存
            if let originalImage =
                info[UIImagePickerController.InfoKey.originalImage]
                as? UIImage {
                parent.captureImage = originalImage
            }
            parent.isShowSheet = false
        }
        
        //キャンセルボタン選択後に呼ばれる
        func imagePickerControllerDidCancel(
            _ picker : UIImagePickerController){
            parent.isShowSheet = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    //Viewを生成するときに実行される
    func makeUIViewController(
        context:UIViewControllerRepresentableContext<ImagePickerView>)-> UIImagePickerController{
        let myImagePickerController = UIImagePickerController()
        myImagePickerController.sourceType = .camera
        myImagePickerController.delegate = context.coordinator
        return myImagePickerController
    }
    
    //Viewを更新するときに実行される
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
}

