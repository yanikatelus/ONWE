//
//  QuoteView.swift
//  ONWE
//
//  Created by Yanika Telus on 4/29/22.
//

import SwiftUI

struct QuoteView: View {
    @State var viewState = CGSize.zero

    var body: some View {
        NavigationView {
        ZStack {
            Image(systemName: "photo")
                .resizable()
                .ignoresSafeArea()//make the image move to corners
                .offset(x: viewState.width, y: viewState.height)
                .gesture(
                    DragGesture().onChanged { value in
                        viewState = value.translation
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            viewState = .zero
                        }
                    })
        }
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
