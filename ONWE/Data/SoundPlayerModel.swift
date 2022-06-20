//
//  SoundPlayerModel.swift
//  ONWE
//
//  Created by Yanika Telus on 6/17/22.
//

import Foundation

final class SoundPlayerViewModel: ObservableObject {
    private(set) var soundPlayer: SoundPlayer
    
    init(soundPlayer: SoundPlayer){
        self.soundPlayer = soundPlayer
    }
}
//struct SoundPlayer : Hashable{
struct SoundPlayer {
    let _id = UUID()
    let tittle: String
    let description : String
    let duration : TimeInterval
    let track : String
    let image: String
    
    static let data = SoundPlayer(tittle: "Rain", description: "testing data", duration: 120, track: "Rain", image: "Rain")
}
