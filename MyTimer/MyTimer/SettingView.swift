//
//  SettingView.swift
//  MyTimer
//
//  Created by 工藤貴央 on 2021/05/04.
//

import SwiftUI

struct SettingView: View {
    
    @AppStorage("timer_value") var timeValue = 10
    
    var body: some View {
        ZStack{
            Color("backgroundSetting")
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                Text("\(timeValue)秒")
                    .font(.title)
                
                Spacer()
                
                Picker(selection: $timeValue, label: Text("選択"), content: {
                    Text("10").tag(10)
                    Text("20").tag(20)
                    Text("30").tag(30)
                    Text("40").tag(40)
                    Text("50").tag(50)
                    Text("60").tag(60)
                    
                })
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
