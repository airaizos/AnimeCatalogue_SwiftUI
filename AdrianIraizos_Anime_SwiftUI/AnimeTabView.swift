//
//  AnimeTabView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 18/4/23.
//

import SwiftUI

struct AnimeTabView: View {
    @EnvironmentObject var viewModel:AnimesViewModel
    @Binding var navigationState: NavigationState
    let namespace:Namespace.ID
    
    var body: some View {
            TabView{
                Group {
                    AnimesListView(navigationState: $navigationState, namespace: namespace)
                        .environmentObject(viewModel)
                        .tabItem {
                            Label("Animes",systemImage: "australsign")
                        }
                    WatchedGridView()
                        .tabItem {
                            Label("Watched",systemImage: "eye")
                        }
                        .badge(viewModel.watched.count)
                }
            }
            .tint(.b13254)
        }
}

struct AnimeTabView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeTabView(navigationState: .constant(.welcome),namespace: Namespace().wrappedValue)
            .environmentObject(AnimesViewModel.animesPreview)
    }
}
