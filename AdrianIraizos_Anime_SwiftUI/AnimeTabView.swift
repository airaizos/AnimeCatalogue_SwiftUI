//
//  AnimeTabView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 18/4/23.
//

import SwiftUI

struct AnimeTabView: View {
    @StateObject var viewModel = AnimesViewModel()
    var body: some View {
        TabView{
            Group {
                AnimesListView()
                    .environmentObject(viewModel)
                    .tabItem {
                        Label("Animes",systemImage: "film")
                    }
                    
            }
        }
    }
}

struct AnimeTabView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeTabView()
            .environmentObject(AnimesViewModel.animesPreview)
    }
}
