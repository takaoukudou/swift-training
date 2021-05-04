//
//  ContentView.swift
//  MyMusic
//
//  Created by 工藤貴央 on 2021/05/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let soundPlayer = SoundPlayer()
        
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fill)
            
            HStack{
                Button(action:{
                    soundPlayer.cymbalPlay()
                }){
                    ButtonImageView(imageName: "cymbal")
                }
                Button(action:{
                    soundPlayer.guitarPlay()
                }){
                    ButtonImageView(imageName: "guitar")                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
