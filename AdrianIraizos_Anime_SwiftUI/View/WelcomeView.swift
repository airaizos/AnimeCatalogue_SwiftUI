//
//  WelcomeView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 19/4/23.
//

import SwiftUI

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
                
                WelcomeLogoView(image: "splash", namespace: namespace, spinning: spinning)
                
                WelcomeText(step: 1, totalSteps: totalSteps, spinning: $spinning)
                
                WelcomeViewText(firstStep: 2, totalSteps: totalSteps, spinning: $spinning)
                
            }
            .animation(.easeIn(duration: 1), value: navigationState)
        }
        .onAppear {
            spinning.toggle()
        }
        .onTapGesture {
            navigationState = .home
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(navigationState: .constant(.welcome),namespace: Namespace().wrappedValue)
    }
}

