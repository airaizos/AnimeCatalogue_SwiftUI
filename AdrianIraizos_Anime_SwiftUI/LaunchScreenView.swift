//
//  LaunchScreenView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 20/4/23.
//

import SwiftUI

struct LaunchScreenView: View {
    @Binding var navigationState: NavigationState
    let namespace: Namespace.ID
    
    @State private var spinning = false
    var body: some View {
        ZStack{
            Color.offWhite
                .ignoresSafeArea()
            
            Group{
                FlipView(isFlipped: spinning) {
                    NeumorphicStrokeStyle(isHighlighted: true, shape: Circle(), image: Image("splash"))
                        .padding()
                } back: {
                    NeumorphicStrokeStyle(isHighlighted: false, shape: Circle(), image: Image("splash"))
                        .padding()
                }
            }
            .scaleEffect(CGSize(width: spinning ? 1 : 0.1, height: spinning ? 1 : 0.1), anchor: .center)
            .matchedGeometryEffect(id: "splash", in: namespace)
        }

        .animation(.spring(response: 1,dampingFraction: 1), value:spinning)
        .onAppear {
            Task {
                try await Task.sleep(for:.seconds(1.0))
                navigationState = .welcome
            }
            spinning.toggle()
        }
        .zIndex(2)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView(navigationState: .constant(.splash), namespace: Namespace().wrappedValue)
    }
}
