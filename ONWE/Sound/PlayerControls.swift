//
//  PlayerControls.swift
//  ONWE
//
//  Created by Yanika Telus on 6/17/22.
//

import SwiftUI

struct PlayerControls: View {
    //button controls will have animation on tap when extracted
    
    var systemName = "play"
    var fontSize : CGFloat = 25
//    var color = Color(red: 0.78, green: 0.91, blue: 0.75, opacity: 0.9)
    var color : Color = .white
    var action: () -> Void
    var body: some View {
        Button{
            action()
        }label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }
    }
}

struct PlayerControls_Previews: PreviewProvider {
    static var previews: some View {
        PlayerControls(action: {})
    }
}
