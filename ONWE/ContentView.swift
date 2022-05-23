//
//  ContentView.swift
//  ONWE
//
//  Created by Yanika Telus on 4/21/22.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor.opaqueSeparator
    }
    
    var body: some View {
        
            TabView{
                MainView()
                    .tabItem {
                        Image(systemName: "sun.haze.fill")
                        Text("Home")
                    }
                
                QuoteView()
                    .tabItem {
                        Image(systemName: "quote.bubble")
                            .environment(\.symbolVariants, .none)
                    }
                JournalView()
                    .tabItem {
                        Image(systemName: "sun.haze")
                    }
            }//end of tab view
//        .tabViewStyle(.page)
//        .indexViewStyle(.page(backgroundDisplayMode: .always))
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }//end of body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
