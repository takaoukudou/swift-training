//
//  ButtonImageView.swift
//  MyMusic
//
//  Created by 工藤貴央 on 2021/05/03.
//

import SwiftUI

struct ButtonImageView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
    }
}

struct ButtonImageView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonImageView(imageName: "cymbal")
    }
}
