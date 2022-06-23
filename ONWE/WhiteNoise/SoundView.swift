//
//  SoundView.swift
//  ONWE
//
//  Created by Yanika Telus on 6/11/22.
//

import SwiftUI

struct SoundView: View {
    @State var shadow = Color(red: 0.09, green: 0.11, blue: 0.05, opacity: 0.3)

    @State private var showPlayingView = false
    @StateObject var soundPlayerViewModel: SoundPlayerViewModel
    @State var Name: String
    @State var Description: String
    
    var body: some View {

        VStack{
            HStack {
                VStack {
                    Button{
                        showPlayingView = true
                    }label: {
                        ExtractedView(shadow: $shadow, backgroundImage: Name, image: Name)
                    }
                    .accentColor(.black)
                    .fullScreenCover(isPresented: $showPlayingView){
                        PlayingView(soundPlayerVM: soundPlayerViewModel ,title: Name)
                    }
                    Text("\(Description) \(soundPlayerViewModel.soundPlayer.duration.formatted())s")
                        .frame(width: 180, height: .infinity, alignment: .center)
                        .font(.subheadline)
                        .padding(5)
                        .foregroundColor(.white)
                } //end of button view
                .padding(.vertical, 20)
                
            } //end of HStack
            .padding(.bottom, 20)
            
            Spacer()
        } //end of VSTACK
        .frame(width: 230, height: 200, alignment: .leading)
            
//        }//end of Zstack
    }//END OF VIEW
}//END OF BodyView

struct SoundView_Previews: PreviewProvider {
    static let soundPlayerViewModel = SoundPlayerViewModel(soundPlayer: SoundPlayer.data)
    static var previews: some View {
        SoundView( soundPlayerViewModel: soundPlayerViewModel, Name: "River", Description: "This is dummy data")
    }
}

struct ExtractedView: View {
    
    @Binding var shadow: Color
    var backgroundImage: String
    var image: String
    
    var body: some View {

                ZStack{
                    Image(backgroundImage)
                        .resizable()
                        .frame(width: 200, height: 150, alignment: .leading)
                        .cornerRadius(20)
                    HStack {
                        Text(backgroundImage)
                            .foregroundColor(.white)
                            .padding(20)
                            .frame(width: 150, height: 150, alignment: .bottomLeading)
                        
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundColor(.white)
                            .padding(20)
                            .frame(width: 40, height: 150, alignment: .bottomTrailing)
                    }
                    .background(shadow)
                    .cornerRadius(20)
                    .padding(.horizontal, 5)
                }//EN dof Zstack
                .shadow(color: shadow, radius: 6, x: 0 , y: 10)
                .padding(.leading, 10)

    }
}

extension DateComponentsFormatter {
    static let abbreviated: DateComponentsFormatter = {
        print("Initializing DateComponentsFormatter.abbreviated")
        let formatter = DateComponentsFormatter()

        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated

        return formatter
    }()

    static let positional: DateComponentsFormatter = {
        print("Initializing DateComponentsFormatter.positional")
        let formatter = DateComponentsFormatter()

        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad

        return formatter
    }()
}
