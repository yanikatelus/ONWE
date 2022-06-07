//
//  ContentView.swift
//  ONWE
//
//  Created by Yanika Telus on 4/21/22.
//

import SwiftUI

struct ContentView: View {
    
    let green = UIColor(red: 0.09, green: 0.11, blue: 0.05, alpha: 0.9)
    //chnage Tab bar background color
    init(){
        UITabBar.appearance().backgroundColor = green
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().barTintColor = green
    }
    
    
    var body: some View {
        
            TabView{
                MainView()
                    .tabItem {
                        Image(systemName: "sun.haze.fill")
                        Text("H O M E")
                        
                    }
                
                QuoteAPIView()
                    .tabItem {
                        Image(systemName: "quote.bubble")
                            .environment(\.symbolVariants, .none)//removes fill
                        Text("Q U O T E")
                    }
                JournalView()
                    .tabItem {
                        Image(systemName: "book.fill")
                        Text("J O U R N A L")
                    }
            }
    }//end of body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
