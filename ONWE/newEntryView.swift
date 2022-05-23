//
//  newEntryView.swift
//  ONWE
//
//  Created by Yanika Telus on 5/22/22.

import SwiftUI


struct newEntryView: View {
    @State var showImagePicker: Bool = false
    @StateObject var imageData = ImageData()
//    @State var items: [String] = ["A", "B", "C"]
    var body: some View {
//        SecondView(elements: $items)
        ZStack {
            Color(red: 0.33, green: 0.42, blue: 0.18)
                .ignoresSafeArea() // color covers everything
            VStack{
//                Text("How are you feeling today?")
//                    .foregroundColor(Color(red: 0.76, green: 0.92, blue: 0.73))
//                    .font(.title2)
//                    .bold()
//                    .padding(.horizontal)
//                    .frame(maxWidth: .infinity, alignment: .leading)
                Button {
                    showImagePicker.toggle()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.white)
                            .frame(width: .infinity, height: 70, alignment: .center)
                            .padding()
                        HStack{
                            VStack{
                                Image("happy")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 40)
                            }
                            Text("Add an Image")
                                .foregroundColor(.gray)
                            .padding()
                        }
                    }//End of zstack (Old entry)
                }
                Spacer()
//                NavigationView {
                    VStack {
                        if imageData.imageNote.isEmpty {
                            Text("Try adding an image!")
                                .italic()
                                .foregroundColor(.gray)
                        } else {
                            NavigationLink("Back", destination: JournalView())
//                            JournalView()
//                            ContentView()
                        }
                    }
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(sourceType: .photoLibrary) { image in
                            imageData.addNote(image: image,
                                              title: "Edit me!",
                                              desc: "")
                        }
                    }
                }
                .environmentObject(imageData)
//            }
        }//end of Zstack^^^^
    }//end of Body
}

struct newEntryView_Previews: PreviewProvider {
    static var previews: some View {
        newEntryView()
    }
}

//struct SecondView: View {
//    @Binding var elements: [String]
//
//    var body: some View {
//        HStack {
//            ForEach(elements, id: \.self) { v in
//                Text(v)
//            }
//        }
//    }
//}
