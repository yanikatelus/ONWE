//
//  SwipeView.swift
//  ONWE
//
//  Created by Yanika Telus on 5/28/22.
//

import SwiftUI

struct SwipeView: View {
    @State var viewModel = ViewModel()
    @State private var offset = CGSize.zero
    
    //params
    var cardContent: String
    var author: String
    
    var body: some View {
        ZStack {
            if let image = viewModel.image{
                image
                    .resizable()
//                    .scaledToFill()
                    .ignoresSafeArea()
                    .overlay(
                        Color(red: 0.09, green: 0.11, blue: 0.05, opacity: 0.6)
                    )
            }else{
                Image("base")
                    .resizable()
                    .ignoresSafeArea()//make the image move to corners
                    .overlay(
                        Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.6)
                    )
//                    .background(.thickMaterial)
            }//end of else
            VStack {
                Text(cardContent)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 300, height: 400)
                Text("Author : \(author)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .bold()
                    .frame(width: 300, height: 50)
            }
            
        }
        .offset(x: offset.width * 0.01, y: offset.height * 1)

        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    withAnimation {
                        viewModel.getNewImage()
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        swipeCard(height: offset.height)
                        viewModel.getNewImage()
                    }
                })
        }
        //removes card by swipping of screen (screen height)
        func swipeCard(height: CGFloat) {
            switch height {
            case -1600...(-150):
                offset = CGSize(width: 0, height: -1600)
            case 150...1600:
                offset = CGSize(width: 0, height: 1600)
            default:
                offset = .zero
            }
        }
}

class ViewModel: ObservableObject{
    @Published var image: Image?
    
    func getNewImage(){
        guard let url = URL(string: "https://source.unsplash.com/random/orientation=portrait") else{
            print("New Image Failed to Load")
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

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            SwipeView(cardContent: "This is a nice quote", author: "ksyehe")
        SwipeView(cardContent: "This wuote doesn't have a real meaning", author: "poiuyt")
        SwipeView(cardContent: "Quote number three", author: "wertyuio")
        SwipeView(cardContent: "Lorem Ipsum", author: " kmnbvcfdgthyjukl, mnbvfghyjuki")
        }
    }
}
