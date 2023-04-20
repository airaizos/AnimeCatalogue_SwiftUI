//
//  WatchedAnimesGridView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 18/4/23.
//

import SwiftUI

struct WatchedAnimesGridView: View {
    @Binding var isPresented:Bool
    @ObservedObject var watchedViewModel = WatchedViewModel()
    
    let gridFlexible:[GridItem] = Array(repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {
        NavigationStack {
            HStack {
                WatchedColumnView(animes: watchedViewModel.ovas, color: .purple, title: "OVA",subtitle: "\(watchedViewModel.ovas.count)")
                WatchedColumnView(animes: watchedViewModel.peliculas, color: .cyan, title: "Pelicula",subtitle: "\(watchedViewModel.peliculas.count)")
                WatchedColumnView(animes: watchedViewModel.especial, color: .green, title: "Especial",subtitle: "\(watchedViewModel.especial.count)")
                WatchedColumnView(animes: watchedViewModel.anime, color: .yellow, title: "Anime",subtitle: "\(watchedViewModel.anime.count)")
            }
            .padding(.vertical)
        }
        .navigationTitle("Watched")
    }
}

struct WatchedAnimesGridView_Previews: PreviewProvider {
   
    static var previews: some View {
        NavigationView {
            WatchedAnimesGridView(isPresented: .constant(true), watchedViewModel: WatchedViewModel(persistence: PersistenceTest()))
        }
    }
}

/*
 Text("OVA").tag(1)
 Text("Pelicula").tag(2)
 Text("Especial").tag(3)
 Text("Anime").tag(4)
 Text("All").tag(0)
 */