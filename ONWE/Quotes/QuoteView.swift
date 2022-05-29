//
//  QuoteView.swift
//  ONWE
//
//  Created by Yanika Telus on 4/29/22.
//

import SwiftUI

class ViewModel: ObservableObject{
    @Published var image: Image?
    
    func getNewImage(){
        guard let url = URL(string: "https://source.unsplash.com/random/orientation=portrait") else{
            print("i did not get the items")
            return
        }
        let task = URLSession.shared.dataTask(with:url) {data,_,_ in
            guard let data = data else { return }
            DispatchQueue.main.async{
                guard let uiImage = UIImage(data: data) else{
                    return
                }
                self.image = Image(uiImage: uiImage)
            }
        }
        task.resume() // will fetch content of url
    }
}

struct QuoteView: View {
    @State var viewModel = ViewModel()
    @State var viewState = CGSize.zero

    var body: some View {
        ZStack {
            if let image = viewModel.image{
                image
                    .resizable()
                    .ignoresSafeArea()//make the image move to corners
                    .overlay(
                        Color(red: 0.09, green: 0.11, blue: 0.05, opacity: 0.2)
                    )
                    .offset(x: viewState.width, y: viewState.height)
                    .gesture(
                        DragGesture().onChanged { value in
                            viewState = value.translation
                            
                            viewModel.getNewImage()
                        }
                        .onEnded { value in
                            withAnimation(.interactiveSpring()) {
                                viewState = .zero
                            }
                        })
            }else{
                Image("base")
                    .resizable()
                    .ignoresSafeArea()//make the image move to corners
                    .overlay(
                        Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.6)
                    )
                    .offset(x: viewState.width, y: viewState.height)
                    .gesture(
                        DragGesture().onChanged { value in
                            viewState = value.translation
                        }
                        .onEnded { value in
                            withAnimation(.interactiveSpring()) {
                                viewState = .zero
                                viewModel.getNewImage()
                            }
                        })
            }//end of else
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

