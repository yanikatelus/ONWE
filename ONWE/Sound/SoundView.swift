//
//  SoundView.swift
//  ONWE
//
//  Created by Yanika Telus on 6/11/22.
//

import SwiftUI

struct SoundView: View {
    @State var shadow = Color(red: 0.09, green: 0.11, blue: 0.05, opacity: 0.3)
    @State var lightGreen = Color(red: 0.78, green: 0.91, blue: 0.75, opacity: 0.9)
    @State var backgroundImage = "photo"
    
    @State private var showPlayingView = false
    @StateObject var soundPlayerViewModel: SoundPlayerViewModel
    
    var body: some View {
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

                ScrollView(.horizontal){
                    HStack {
                        Button{
                            showPlayingView = true
                        }label: {
                            ExtractedView(shadow: $shadow, backgroundImage: $backgroundImage)
                        }
                        .accentColor(.black)
                        .fullScreenCover(isPresented: $showPlayingView){
                            PlayingView(title: "This is a tittle")
                        }
                        
                        
                    }//end of HStack
                }//end of scrollview
                Spacer()
                
                
            }//end of VSTACK
            
        }//end of
//        .fullScreenCover(isPresented: $showPlayingView){
//            PlayingView(title: "This is a tittle")
//        }
    }//END OF VIEW
}//END OF BodyView

struct SoundView_Previews: PreviewProvider {
    static let soundPlayerViewModel = SoundPlayerViewModel(soundPlayer: SoundPlayer.data)
    static var previews: some View {
        SoundView( soundPlayerViewModel: soundPlayerViewModel)
    }
}

struct ExtractedView: View {
    @Binding var shadow: Color
    @Binding var backgroundImage: String
    var body: some View {

                ZStack{
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 200, height: 150, alignment: .leading)
                    HStack {
                        Text("Sound Name")
                            .foregroundColor(.white)
                            .padding(20)
                            .frame(width: 150, height: 150, alignment: .bottomLeading)
                        
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundColor(.white)
                            .padding(20)
                        
                            .frame(width: 40, height: 150, alignment: .bottomTrailing)
                    }
                    .padding()
//                    .background(shadow)
//                    .background(.thinMaterial)
                }//EN dof Zstack
                .shadow(color: shadow, radius: 6, x: 0 , y: 10)
                .padding(.leading, 10)

    }
}
