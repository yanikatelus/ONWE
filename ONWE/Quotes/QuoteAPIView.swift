//
//  QuoteAPIView.swift
//  ONWE
//
//  Created by Yanika Telus on 5/28/22.
//

import SwiftUI

struct QuoteAPIView: View {
    @State private var results = [Result]()
    private var happiness = "https://quotable.io/quotes?tags=happiness"
    private var inspirational = "https://quotable.io/quotes?tags=inspirational"
    private var love = "https://quotable.io/quotes?tags=love"
    private var success = "https://quotable.io/quotes?tags=success"
    private var accentColor = Color(red: 0.89, green: 0.96, blue: 0.88, opacity: 0.9)
    
    var body: some View {
        ZStack{
            ZStack{
                ForEach(results, id: \._id) { item in
                    ZStack() {
                        SwipeView(cardContent: item.content, author: item.author)
                    }
                }
            }//end of 2nd zstack
            VStack{
                Spacer()
                HStack{
                    //*****happiness
                    Button(action: {
                        Task {
                            await loadData(url: happiness)
                        }
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .frame(width: 90, height: 25)
                            Text("HAPPY")
                                .bold()
                                .padding(20)
                                .foregroundColor(.black)
                        }
                    })
                    .foregroundColor(accentColor)
                    
                    //*****inspirational
                    Button(action: {
                        Task {
                            await loadData(url: inspirational)
                        }
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .frame(width: 90, height: 25)
                            Text("INSPIRE")
                                .bold()
                                .padding(20)
                                .foregroundColor(.black)
                        }
                    })
                    .foregroundColor(accentColor)
                    
                    //*****inspirational
                    Button(action: {
                        Task {
                            await loadData(url: love)
                        }
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .frame(width: 90, height: 25)
                            Text("LOVE")
                                .bold()
                                .padding(20)
                                .foregroundColor(.black)
                        }
                    })
                    .foregroundColor(accentColor)
                    
                }
            }//end of VStack
        }//end of ZStack
        .task {
            await loadData(url: inspirational)
        }
        .onAppear { // ADD THESE
          UITableView.appearance().backgroundColor = .clear
        }

    }
    func loadData(url: String) async {
        guard let url2 = URL(string: url) else{
            return
        }//end of else
        do{
            let (data, _) = try  await URLSession.shared.data(from: url2)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self,from: data){
                results = decodedResponse.results
            }
        }catch{
            print("invalid data")
        }
    }
}

struct QuoteAPIView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteAPIView()
    }
}
