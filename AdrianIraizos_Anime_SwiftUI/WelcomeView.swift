//
//  WelcomeView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 19/4/23.
//

import SwiftUI

struct WelcomeView: View {
    var isActive:Bool
    var body: some View {
        ZStack {
            Color.offWhite
                .ignoresSafeArea()
            VStack {
               
                  
                     
                    NeumorphicStrokeStyle(isHighlighted: false, shape: Circle(), image: Image("splash"))
                        
                
                Text("Welcome to Anime Library")
                    .foregroundColor(.offWhite)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .shadow(radius: 3,x:5,y:5)
                
                Group {
                    Text("Mark your favorites anime")
                    Text("Mark all that you already watched")
                    Text("Share an anime with your friends")
                    Text("Search and filter animes")
                    Text("See the details")
                    
                }
                .font(.headline)
                
            }
        }
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(isActive: true)
    }
}

struct NeumorphicStrokeStyle<S:Shape>: View {
    var isHighlighted: Bool
    var shape:S
    var image:Image
    var body: some View {
        ZStack {
            image
            .resizable()
            .scaledToFit()
         
            .clipShape(Circle())
          
            if isHighlighted {
                shape
                    .fill(Color.offWhite)
                    .overlay(
                        shape
                            .stroke(Color.gray,lineWidth:4)
                            .blur(radius:4)
                            .offset(x:2, y:2)
                            .mask(shape.fill(LinearGradient(colors: [Color.black,Color.clear], startPoint: .topLeading, endPoint: .bottomTrailing)))
                    )
            } else {
                image
                .resizable()
                .scaledToFit()
             
                .clipShape(Circle())
                shape
                    .fill(Color.offWhite)
                    .shadow(color:Color.black.opacity(0.2), radius: 10, x:10, y:10)
                    .shadow(color:Color.white.opacity(0.7), radius: 10, x:5, y:5)
            }
        }
        .animation(nil, value: 0)
    }
}
