//
//  iPadAnimeTabView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 18/4/23.
//

import SwiftUI

struct iPadAnimeTabView: View {
    @EnvironmentObject var viewModel:AnimesViewModel
    @Binding var navigationState: NavigationState
    let namespace:Namespace.ID
    
    var body: some View {
        TabView{
            Group {
                iPadAnimesListView(navigationState: $navigationState, namespace: namespace)
                    .environmentObject(viewModel)
                    .tabItem {
                        Label("Animes",systemImage: "australsign")
                    }
                WatchedGridView()
                  
                    .tabItem {
                        Label("Watched",systemImage: "eye")
                    }
            }
        }
    }
}

struct iPadAnimeTabView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeTabView(navigationState: .constant(.welcome),namespace: Namespace().wrappedValue)
            .environmentObject(AnimesViewModel.animesPreview)
    }
}
