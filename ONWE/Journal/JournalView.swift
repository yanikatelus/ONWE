//
//  JournalView.swift
//  ONWE
//
//  Created by Yanika Telus on 4/29/22.
//

import SwiftUI

struct JournalView: View {
    @StateObject var notes = Notes()
    @State private var sheetIsShowing = false
    
    var body: some View {
        NavigationView {
        ZStack {
            Color(red: 0.33, green: 0.42, blue: 0.18)
            .ignoresSafeArea() // color runs past safe area
            VStack{
                Text("How are you feeling today?")
                    .foregroundColor(Color(red: 0.76, green: 0.92, blue: 0.73))
                    .font(.title2)
                    .bold()
                    .padding(.top)
                    .padding(.horizontal, 25)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Button {
                    withAnimation {
                        self.sheetIsShowing.toggle()
                    }
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color(red: 0.76, green: 0.92, blue: 0.73))
                        .frame(width: .infinity, height: 50, alignment: .center)
                        HStack{
                            Text("I'm feeling  . . . . . . . ")
                            .foregroundColor(Color(red: 0.33, green: 0.42, blue: 0.18))
                            .font(.title2)
                            Spacer()
                            Image(systemName: "arrow.forward.circle.fill")
                                .font(.title2)
                                .foregroundColor(Color(red: 0.33, green: 0.42, blue: 0.18))
                        }
                        .padding()
                    }//ZStack
                }//End of Label
                .accentColor(.white)
                .padding(.horizontal)
                
            Text("Past Entries")
                .foregroundColor(Color(red: 0.76, green: 0.92, blue: 0.73))
                .font(.title2)
                .bold()
                .padding(.top, 30)
                .padding(.horizontal, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            NoteView()
                .sheet(isPresented: $sheetIsShowing) {
                    EditNoteView()
                }
                    .padding(0)
        }// end of NavView
        .environmentObject(notes)
        }//ZStack
        }//Navview
    }//end
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}

