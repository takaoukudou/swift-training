//
//  ContentView.swift
//  MyFirst
//
//  Created by 工藤貴央 on 2021/04/28.
//

import SwiftUI

struct ContentView: View {
    
    @State var outputText = "こんにちわ"
    
    var body: some View {
        VStack{
            Text(outputText)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.green)
                .padding()
            Button(action: {
                outputText = "Swift使ってるぜ！"
                print("デバッグテストだぜ")
            }) {
                Text("切り替えボタン")
                    .foregroundColor(Color.white)
                    .padding(.all)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()}
    }
}
