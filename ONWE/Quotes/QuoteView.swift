//
//  QuoteView.swift
//  ONWE
//
//  Created by Yanika Telus on 4/29/22.
//

import SwiftUI

//Combined in QuoteAPIView
struct QuoteView: View {

    var body: some View {
        
        ZStack {
            Text("No more new Quotes")
                .font(.largeTitle)
                .foregroundColor(.white)
            QuoteAPIView()
                .onAppear { // ADD THESE
                  UITableView.appearance().backgroundColor = .clear
                }
        }//end of zstack
        .background(Color(red: 0.09, green: 0.11, blue: 0.05))
        
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}

