//
//  SwipeView.swift
//  ONWE
//
//  Created by Yanika Telus on 5/28/22.
//

import SwiftUI

struct SwipeView: View {
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    @State var detail: ViewModel = ViewModel()
    var person: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 320, height: 320)
                .cornerRadius(25)
                .foregroundColor(Color(red: 0.09, green: 0.11, blue: 0.05, opacity: 0.9))
                .shadow(radius: 4)
            HStack {
                Text(person)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 320, height: 300)
            }
            
        }
        .offset(x: offset.width * 1, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    withAnimation {
//                        changeColor(width: offset.width)
                        self.detail.getNewImage()
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        swipeCard(width: offset.width)
//                        changeColor(width: offset.width)
                        self.detail.getNewImage()
                    }
                })
        }
        
        func swipeCard(width: CGFloat) {
            switch width {
            case -500...(-150):
                offset = CGSize(width: -500, height: 0)
            case 150...500:
                offset = CGSize(width: 500, height: 0)
            default:
                offset = .zero
            }
        }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
        SwipeView(person: "gjhkkhvcfghjkbvgcfrtyhjbnvcfdghj")
        SwipeView(person: "gfhjkl")
        }
    }
}
