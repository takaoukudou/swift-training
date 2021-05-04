//
//  OkashiData.swift
//  MyOkashi
//
//  Created by 工藤貴央 on 2021/05/04.
//

import SwiftUI
import Foundation
import UIKit

struct OkashiItem: Identifiable {
    let id = UUID()
    let name:String
    let link: URL
    let image:UIImage
}

class OkashiData: ObservableObject{
    struct ResultJson: Codable {
        struct Item: Codable {
            let name: String?
            let url: URL?
            let image: URL?
        }
        let item: [Item]?
    }
    
    @Published var okashiList: [OkashiItem] = []
    
    func searchOkashi(keyword:String){
        print(keyword)
        
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        print(req_url)
        
        
        let req = URLRequest(url: req_url)
        let session = URLSession(configuration: .default,delegate: nil,delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with:req,completionHandler: {
            (data,response,error) in
            session.finishTasksAndInvalidate()
            
            do{
                let decorder = JSONDecoder()
                let json = try decorder.decode(ResultJson.self, from: data!)
            
                if let items = json.item {
                    self.okashiList.removeAll()
                    
                    for item in items {
                        if let name = item.name,
                        let link = item.url,
                        let imageUrl = item.image,
                        let imageData = try? Data(contentsOf: imageUrl),
                        let image = UIImage(data: imageData)?.withRenderingMode(.alwaysOriginal){
                            let okashi = OkashiItem(name:name,link:link,image:image)
                            self.okashiList.append(okashi)
                        }
                    }
                    print(self.okashiList)
                }
                
            }catch{
                print("error!!!!")
            }
        })
        task.resume()
    }
}
