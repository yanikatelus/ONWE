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
struct SoundPlayer{
    let _id = UUID()
    let tittle: String
    let description : String
    let duration : TimeInterval
    let track : String
    let image: String
    
    static let data = SoundPlayer(tittle: "Title ex 1", description: "This is a very long description", duration: 70, track: "rain", image: "rain")
}
