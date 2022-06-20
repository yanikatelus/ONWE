//
//  PlayingView.swift
//  ONWE
//
//  Created by Yanika Telus on 6/17/22.
//

import SwiftUI

struct PlayingView: View {
    @EnvironmentObject var audioManager: AudioManager
    
    var soundPlayerVM: SoundPlayerViewModel
    @State var lightGreen = Color(red: 0.78, green: 0.91, blue: 0.75, opacity: 0.9)
    @State private var sliderValue : Double = 0.0
    @State private var volumeBar : Double = 0.0
    
    @State private var isEditing: Bool = false
    var isPreview: Bool = false
    @State var title: String
    
    @Environment(\.dismiss) var disssmiss
    let timer = Timer
        .publish(every: 0.25, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        
        
        ZStack{
            
            Image(title)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width)
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 10){
                Button{
                    disssmiss()
                }label: {
                    HStack {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(5)
                            .shadow(color: Color( red: 0, green: 0, blue: 0, opacity: 0.9), radius: 25, x: 0 , y: 10)
                            Spacer()
                    }//END OF HStack
                }//END of Label/Button
                Text(title)
                    .bold()
                    .font(.title)
                    .foregroundColor(lightGreen)
                Spacer()
                
                //optional binding
                if let player = audioManager.player {
                    VStack{
                        
                        Slider(value: $sliderValue, in: 0...player.duration){ editing in
                            print("editing", editing)
                            isEditing = editing
                            
                            if !editing {
                                player.currentTime = sliderValue
                            }
                            
                        }
                            //will be depricated in future versions of IOS
                            .accentColor(.white)
                        HStack{
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            Spacer()
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                        }
                        .foregroundColor(.white)
                        
                        HStack{
                            //Control: Repeat
                            PlayerControls(systemName: "repeat"){
                                
                            }
                            Spacer()
                            
                            //Control: Go Backwards 15s
                            PlayerControls(systemName: "gobackward.15"){
                                
                            }
                            
                            //Control: PLAY
                            PlayerControls(systemName: "play.fill", fontSize: 45){
                                
                            }
                            .padding(.horizontal, 20)
                            
                            //Control: Repeat
                            PlayerControls(systemName: "goforward.15"){
                                
                            }
                            Spacer()
                            //Control: Repeat
                            PlayerControls(systemName: "repeat"){
                                
                            }
                        }
                        
                        HStack{
                            //Volume bar
                            Slider(value: $volumeBar, in: 0...100)
                                //will be depricated in future versions of IOS
                                .accentColor(.white)
                                .padding(.horizontal, 30)
                                .opacity(0.7)
                        }//end of Hstack
                        
                    }//END  of  Vstack
                }//END OF IF LET
                
            }//end of VSTACK
            .padding()
            
        }//END of ZStack
        .frame(width: UIScreen.main.bounds.width)
        .onAppear(){
            audioManager.startPlayer(track: title, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else { return }
            sliderValue = player.currentTime
        }
        
        
    }//End of Body View
}//END OF PlayingView

struct PlayingView_Previews: PreviewProvider {
    static let soundPlayerViewModel = SoundPlayerViewModel(soundPlayer: SoundPlayer.data)
    
    static var previews: some View {
        PlayingView(soundPlayerVM: soundPlayerViewModel, isPreview: true, title: "Rain")
        //prevent preview from crashing
            .environmentObject(AudioManager())
    }
}
