//
//  EditNoteView.swift
//  ONWE
//
//  Created by Yanika Telus on 5/23/22.
//

import SwiftUI

struct EditNoteView: View {
    @State private var title = ""
    @State private var content = ""
    @State private var emoticon = ""
    @EnvironmentObject var notes: Notes
    @Environment(\.dismiss) var dismiss
    
    enum Option: String, CaseIterable, Identifiable {
        case depressed
        case sad
        case indifferent
        case happy
        case estatic
       var id: String { self.rawValue }
   }

    @State var selection: Option = .sad
    
    @State private var pickerSelection = "indifferent"
    var body: some View {
        
        Form {
            Section {
                VStack {
                   Picker(selection: $selection,
                          label: Text("Picker"),
                          content: {
                               ForEach(Option.allCases) { option in
                               Text(option.rawValue.capitalized) .tag(option)
                           }
                          })
                        .background(Color(red: 0.89, green: 0.96, blue: 0.88))
                       .padding()
                       .pickerStyle(SegmentedPickerStyle())

                    Text("\(selection.rawValue)")
                        .foregroundColor(.white)
                        .textCase(.uppercase)
                    Image("\(selection.rawValue)")
               }//end of VStack
                
// if you have more time make the background change depending on the selected value => get selection == selection.rawValue
//           Text("Selected value \(selection.rawValue)")
                
                ZStack{
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color(red: 0.89, green: 0.96, blue: 0.88))
                    TextField("Note Title", text: $title)
                        .foregroundColor(Color(red: 0.33, green: 0.42, blue: 0.18))
                        .font(.title3)
                    
                        .limitText($title, to: 20)
                        .padding(.horizontal)
                    Spacer()
                    HStack {
                        Spacer()
                        Text("\(title.count)/20")
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                
                
                ZStack {
                    TextEditor(text: $content)
                        .frame(idealHeight: 325)
                        .padding(1)
                        .font(.title3)
                        .foregroundColor(.white)
                }//Zstack
                HStack {
                    Spacer()
                    Button("ADD NOTE") {
                        notes.addNote(title: title, content: content, emoticon: selection.rawValue)
                        dismiss()
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    Spacer()
                }
            }
            .listRowBackground(Color(red: 0.33, green: 0.42, blue: 0.18))

        }//end of form
        .onAppear { // ADD THESE
          UITableView.appearance().backgroundColor = .clear
        }
    }
}

extension View {
    func limitText(_ text: Binding<String>, to characterLimit: Int) -> some View {
        self
            .onChange(of: text.wrappedValue) { _ in
                text.wrappedValue = String(text.wrappedValue.prefix(characterLimit))
            }
    }
}

struct EditNoteView_Previews: PreviewProvider {
    static var previews: some View {
        EditNoteView()
            .environmentObject(Notes())
            .previewInterfaceOrientation(.portrait)
    }
}
