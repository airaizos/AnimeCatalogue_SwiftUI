//
//  WatchedAnimesGridView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 18/4/23.
//

import SwiftUI

struct WatchedAnimesGridView: View {
    @ObservedObject var watchedViewModel = WatchedViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyHStack {
                    WatchedColumnView(animes: watchedViewModel.ovas, color: .purple, title: "OVA",subtitle: "\(watchedViewModel.ovas.count)")
                    WatchedColumnView(animes: watchedViewModel.peliculas, color: .cyan, title: "Pelicula",subtitle: "\(watchedViewModel.peliculas.count)")
                    WatchedColumnView(animes: watchedViewModel.especial, color: .green, title: "Especial",subtitle: "\(watchedViewModel.especial.count)")
                    WatchedColumnView(animes: watchedViewModel.anime, color: .yellow, title: "Anime",subtitle: "\(watchedViewModel.anime.count)")
                }
                .navigationDestination(for: Anime.self, destination: { value in
                    AnimeDetailView(detailViewModel: AnimeDetailViewModel(anime: value))
                })
                .padding(.vertical)
            }
            .navigationTitle("Watched")
        }
    }
}

struct WatchedAnimesGridView_Previews: PreviewProvider {
   
    static var previews: some View {
        NavigationView {
            WatchedAnimesGridView(watchedViewModel: WatchedViewModel(persistence: PersistenceTest()))
        }
    }
}
