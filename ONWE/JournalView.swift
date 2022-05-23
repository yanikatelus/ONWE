//
//  JournalView.swift
//  ONWE
//
//  Created by Yanika Telus on 4/29/22.
//

import SwiftUI

struct JournalView: View {
    @State private var emoticon: [String] = ["depressed","sad","indifferent","happy","estatic"]
    @EnvironmentObject var imageData : ImageData
    
    var body: some View {
//        let date = (Date.now.formatted(date: .numeric, time: .omitted))
        
        NavigationView{
        ZStack {
            Color(red: 0.33, green: 0.42, blue: 0.18)
                .ignoresSafeArea() // color covers everything
            VStack{
                Text("How are you feeling today?")
                    .foregroundColor(Color(red: 0.76, green: 0.92, blue: 0.73))
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                //The emotion buttons are repeated
                HStack{
                    ButtonEmoticon(_emoticon: $emoticon)
                }
                //reused element under date
                Text("Past Entries")
                    .foregroundColor(Color(red: 0.76, green: 0.92, blue: 0.73))
                    .font(.title2)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
            }
            .navigationTitle("Journal")
        }//end of ZStack
        .accentColor(.white)
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}

struct ButtonEmoticon: View{
    @Binding var emoticon: [String]
    init( _emoticon: Binding<[String]>){
            self._emoticon = _emoticon
    }
    
    var body: some View {
        
        HStack{
            ForEach(emoticon, id: \.self) { (v: String) in
                HStack{
                    //somewho pass the current labe to new view
                    NavigationLink(destination: newEntryView()) {
                    VStack{
                        Image(v)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Text(v)
                    }//vstack

                    }//end of navigation link
                }//Hstack
            }//end of for each
        }//end of Vstack
        
    }//end of body
}//end of ButtonEmoticonView
