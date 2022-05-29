//
//  QuoteAPIView.swift
//  ONWE
//
//  Created by Yanika Telus on 5/28/22.
//

import SwiftUI

struct QuoteAPIView: View {
    @State private var results = [Result]()
    
    var body: some View {
        
        List(results, id: \._id) { item in
            VStack(alignment: .leading) {
                Text(item.content)
                    .foregroundColor(.blue)
                   
                Text(item.author)
            }
        }
        .task {
            await loadData()
        }

    }
    func loadData() async {
        guard let url2 = URL(string: "https://quotable.io/quotes?page=1") else{
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