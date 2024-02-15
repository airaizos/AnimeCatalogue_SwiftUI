//
//  InitialView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 20/4/23.
//

import SwiftUI

struct InitialView: View {
    @StateObject var viewModel = AnimesViewModel()
    @Namespace var namespace
    @Binding var navigationState: NavigationState
    
    var body: some View {
        Group {
            switch navigationState {
                
            case .splash:
                LaunchScreenView(navigationState: $navigationState, namespace: namespace)
                    .transition(.opacity)
                
            case .welcome: WelcomeView(navigationState: $navigationState, namespace: namespace)
                    .transition(.opacity)
                
            case .home:
                Group {
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        iPadAnimeTabView(navigationState: $navigationState, namespace: namespace)
                            .transition(.push(from: .top))
                        
                    } else {
                        AnimeTabView(navigationState: $navigationState, namespace: namespace)
                            .transition(.push(from: .top))
                    }
                }
            }
        }
        .animation(.easeIn, value:navigationState)
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView(navigationState: .constant(.splash))
            .environmentObject(AnimesViewModel.animesPreview)
    }
}
