//
//  WhiteNoiseView.swift
//  ONWE
//
//  Created by Yanika Telus on 6/19/22.
//

import SwiftUI

struct WhiteNoiseView: View {
    @State var shadow = Color(red: 0.09, green: 0.11, blue: 0.05, opacity: 0.3)
    var lightGreen = Color(red: 0.78, green: 0.91, blue: 0.75)
//    @State var list = [SoundPlayer]()
    var nameArray = ["Rain", "Cricket", "River"]
    var calmArray = ["Calm", "Uplifting", "Bliss"]
    static let soundPlayerViewModel = SoundPlayerViewModel(soundPlayer: SoundPlayer.data)
    
    var body: some View {
//        let rain = SoundPlayer.init(tittle: "Rain", description: "2 Minutes of Calming rain", duration: 122, track: "Rain", image: "Rain")
        
        ZStack {
            Color(red: 0.33, green: 0.42, blue: 0.18)
                .ignoresSafeArea()
            VStack{
                Text("My Sounds")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("White Noise")
                    .font(.title2)
                    .bold()
                    .foregroundColor(lightGreen)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal) {
                    HStack {
//                        ForEach(list, id: \.self){ elm in
//                            list.append(rain)
//                            SoundView(shadow: shadow, soundPlayerViewModel: WhiteNoiseView.soundPlayerViewModel, Name: elm.tittle, Description: elm.description)
//                        }
                        ForEach(nameArray, id: \.self) { name in
                            SoundView(shadow: shadow, soundPlayerViewModel: WhiteNoiseView.soundPlayerViewModel, Name: name, Description: name)
                        }
                    }//HStack
                    .padding(.top, 10 )
                }//Scrollview
                
                Text("Calm Music")
                    .font(.title2)
                    .bold()
                    .foregroundColor(lightGreen)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(calmArray, id: \.self) { name in
                            SoundView(shadow: shadow, soundPlayerViewModel: WhiteNoiseView.soundPlayerViewModel, Name: name, Description: name)
                        }
                    }//HStack
                    .padding(.vertical, 20 )
                }//Scrollview
                Spacer()
            }//END of VSTACK
        } //End Zstack
    } //END
}//END

struct WhiteNoiseView_Previews: PreviewProvider {
    static var previews: some View {
        WhiteNoiseView()
            .environmentObject(AudioManager())
    }
}
