//
//  ONWEApp.swift
//  ONWE
//
//  Created by Yanika Telus on 4/21/22.
//

import SwiftUI

@main
struct ONWEApp: App {
    @StateObject var audioManager = AudioManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
}

struct Previews_ONWEApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
