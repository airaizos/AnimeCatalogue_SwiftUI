//
//  InitialView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 20/4/23.
//

import SwiftUI

struct InitialView: View {
    @EnvironmentObject var viewModel:AnimesViewModel
    @Namespace var namespace
    @State var navigationState: NavigationState = .splash
    
    var body: some View {
        Group {
            
         
            switch navigationState {
                
            case .splash:                LaunchScreenView(state: $navigationState, namespace: namespace)
                    .transition(.opacity)
                
            case .welcome: WelcomeView(navigationState: $navigationState, nameSpace: namespace)
                    .transition(.opacity)
                
            case .home:
                LaunchScreenView(state: $navigationState, namespace: namespace)
                        .transition(.opacity)
            }
            
        }
        
        .animation(.default, value:navigationState)
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
            .environmentObject(AnimesViewModel.animesPreview)
    }
}
