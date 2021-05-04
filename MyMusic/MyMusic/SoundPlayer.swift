//
//  SoundPlayer.swift
//  MyMusic
//
//  Created by 工藤貴央 on 2021/05/03.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    let cymbalData = NSDataAsset(name:"cymbalSound")!.data
    var cymbalPlayer: AVAudioPlayer!
    let guitarData = NSDataAsset(name:"guitarSound")!.data
    var guitarPlayer: AVAudioPlayer!

    func cymbalPlay(){
        do{
            cymbalPlayer = try AVAudioPlayer(data: cymbalData)
            
            cymbalPlayer.play()
        }catch{
            print("error")
        }
    }
    func guitarPlay(){
        do{
            guitarPlayer = try AVAudioPlayer(data: guitarData)
            
            guitarPlayer.play()
        }catch{
            print("error")
        }
    }
}
