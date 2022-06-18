//
//  SoundPlayer.swift
//  ONWE
//
//  Created by Yanika Telus on 6/13/22.
//

import Foundation
import AVFoundation

//class SoundPlayer: ObservableObject{
//    
//    @Published var player: AVAudioPlayer? = nil
//    
//    let HA_HA_FILE = "haha"
//    let HA_HA_FORMAT = "mp3"
//    
//    init(){
//        if let soundFilePath = Bundle.main.path(forResource: HA_HA_FILE, ofType: HA_HA_FORMAT){
//            let fileUrl = URL(fileURLWithPath: soundFilePath)
//            
//            do{
//                player = try AVAudioPlayer(contentsOf: fileUrl)
//            }catch{
//                player = nil
//                print(error)
//            }
//        }
//        player?.prepareToPlay()
//    }//init
//    
//    
//}
