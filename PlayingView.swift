//
//  PlayingView.swift
//  ONWE
//
//  Created by Yanika Telus on 6/17/22.
//

import SwiftUI

struct PlayingView: View {
    @State var lightGreen = Color(red: 0.78, green: 0.91, blue: 0.75, opacity: 0.9)
    @State private var sliderValue : Double = 0.0
    @State var title: String
    
    @Environment(\.dismiss) var disssmiss
    
    var body: some View {
        
        
        ZStack{
            
            Image("base")
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
                
                VStack{
                    Slider(value: $sliderValue, in: 0...60)
                        //will be depricated in future versions of IOS
                        .accentColor(.white)
                    HStack{
                        Text("0:00")
                        Spacer()
                        Text("10:00")
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
                    }
                }//END  of  Vstack
            }//end of VSTACK
            .padding()
            
        }//END of ZStack
        .frame(width: UIScreen.main.bounds.width)
        
        
    }//End of Body View
}//END OF PlayingView

struct PlayingView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingView(title: "Example Tittle")
    }
}
