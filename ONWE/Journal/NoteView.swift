//
//  NoteView.swift
//  ONWE
//
//  Created by Yanika Telus on 5/23/22.
//

import SwiftUI

struct NoteView: View {
    @EnvironmentObject var notes: Notes
    @State private var isActive = true
        
    var body: some View {
        List {
            ForEach(notes.notes) { note in
                let dates = note.timeStamp.components(separatedBy: " ")
                let weekday = dates[0]
                let month = dates[1]
                let day = dates [2]
                VStack(alignment: .leading) {
                    HStack{
                        VStack{
                        //this will be a stored value (day of week)
                            Text("\(weekday)")
                            .font(.title2)
                            .foregroundColor(Color(red: 0.33, green: 0.42, blue: 0.18))
                            .fontWeight(.heavy)
                            Text("\(month)/\(day)")
                            .font(.title2)
                            Text(note.title)
                                .foregroundColor(Color(red: 0.33, green: 0.42, blue: 0.18))
                                .font(.headline)
                                .padding(.vertical)
                            Image(note.emoticon)
                        }
                        .frame(width: 80)
                        Spacer()
                    FamilyItemView(title: note.content, isActive: $isActive)
                        .onTapGesture {
                            self.isActive.toggle()
                        }
//                    Text(note.content)
//                        .font(.body)
//                        .foregroundColor(Color(red: 0.33, green: 0.42, blue: 0.18))
//                        .padding(.vertical)
//                        .lineLimit(4)
                    Spacer()
                    }//end of hstack
                }//end of vstack
            }//end of for each
            .onDelete(perform: deleteNote)
            .listRowBackground(Color(red: 0.89, green: 0.96, blue: 0.88))
        }//end of lists
        .onAppear { // ADD THESE
          UITableView.appearance().backgroundColor = .clear
        }
    }//end of body
    
    func deleteNote(at offsets: IndexSet) {
        notes.notes.remove(atOffsets: offsets)
    }
}

struct FamilyItemView: View {
    
    @State var title: String
    @Binding var isActive: Bool
    
    var body: some View {
        HStack {
            if isActive {
                Text(title)
                    .font(.body)
                    .foregroundColor(Color(red: 0.33, green: 0.42, blue: 0.18))
                    .padding(.vertical)
                    .lineLimit(4)
            } else {
                Text(title)
                    .font(.body)
                    .foregroundColor(Color(red: 0.33, green: 0.42, blue: 0.18))
                    .padding(.vertical)
                    .lineLimit(nil)
            }
            
//            Text("\(title)")
        }.padding()
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
            .environmentObject(Notes())
            .previewInterfaceOrientation(.portrait)
    }
}
