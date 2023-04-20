//
//  WelcomeView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 19/4/23.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var navigationState: NavigationState
    @State var spinning = true
    
    let namespace:Namespace.ID
    let totalSteps = 7
    var body: some View {
        ZStack {
            Color.offWhite
                .ignoresSafeArea()
            VStack(spacing:10) {
                    NeumorphicStrokeStyle(isHighlighted: false, shape: Circle(), image: Image("splash"))
                    .matchedGeometryEffect(id: "splash", in: namespace)
                    .scaleEffect(CGSize(width: spinning ? 0.1 : 1, height: spinning ? 0.1 : 1), anchor: .center)
                    
                Text("Welcome to Anime Library")
                    .foregroundColor(.offWhite)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .shadow(radius: 3,x:5,y:5)
                    .modifier(OpenAnimation(launch: $spinning, step: 1, totalSteps: totalSteps))
                Group {
                   
                    Text("Mark your favorites anime")
                        .modifier(OpenAnimation(launch: $spinning, step: 2, totalSteps: 7))
                    Text("Mark all that you already watched")
                        .modifier(OpenAnimation(launch: $spinning, step: 3, totalSteps: totalSteps))
                    Text("Share an anime with your friends")
                        .modifier(OpenAnimation(launch: $spinning, step: 4, totalSteps: totalSteps))
                    Text("Search and filter animes")
                        .modifier(OpenAnimation(launch: $spinning, step: 5, totalSteps: totalSteps))
                    Text("See the details")
                        .modifier(OpenAnimation(launch: $spinning, step: 6, totalSteps: totalSteps))
                    
                }
                .foregroundColor(.b471337.opacity(0.7))
                .font(.headline)
                Button {
                    navigationState = .home
                } label: {
                    Image(systemName: "arrow.up.forward")
                }
                .buttonStyle(NeumorphicButtonStyle(isActive: true))
                .modifier(OpenAnimation(launch: $spinning, step: 7, totalSteps: totalSteps))
            }
            .animation(.easeIn(duration: 1), value: navigationState)
        }
        .onAppear {
         
                Task {
                    try await Task.sleep(for:.seconds(1.0))
   
                }
            spinning.toggle()
        }
        
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(navigationState: .constant(.welcome),namespace: Namespace().wrappedValue)
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
            .zIndex(1)
            
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
        .animation(.easeIn, value: 0)
    }
}
