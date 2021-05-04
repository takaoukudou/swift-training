//
//  ContentView.swift
//  MyMap
//
//  Created by 工藤貴央 on 2021/05/03.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var inputText:String = ""
    @State var dispSearchKey:String = ""
    @State var dispMapType:MKMapType = .standard
    
    var body: some View {
        VStack{
            TextField("キーワードを入力してください",
                      text: $inputText, onCommit:{
                        dispSearchKey = inputText
                        print("入力したキーワード："+dispSearchKey)
                      })
                .padding()
            
            ZStack(alignment: .bottomTrailing){
                MapView(searchKey: dispSearchKey,mapType:dispMapType)
            
                Button(action: {
                    if dispMapType == .standard {
                        dispMapType = .satellite
                    }else if dispMapType == .satellite{
                        dispMapType = .hybrid
                    }else if dispMapType == .hybrid{
                        dispMapType = .satelliteFlyover
                    }else if dispMapType == .satelliteFlyover{
                        dispMapType = .hybridFlyover
                    }else if dispMapType == .hybridFlyover{
                        dispMapType = .mutedStandard
                    }else {
                        dispMapType = .standard
                    }
                }){
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35, height:35, alignment: .leading)
                        .padding(.trailing,20)
                        .padding(.bottom,30)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
