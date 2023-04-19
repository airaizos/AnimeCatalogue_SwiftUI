//
//  WatchedViewModel.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 18/4/23.
//

import Foundation

final class WatchedViewModel:ObservableObject {
    
    let persistence:ModelPersistence
    @Published var watchedAnimes:[Anime]
    @Published var title = "titulo"
    
    init(persistence:ModelPersistence = .shared) {
        self.persistence = persistence
        self.watchedAnimes = []
        Task {
            await getWatchedAnimes()
        }
    }
    func getFirst() -> Anime {
        if let primero = watchedAnimes.first {
            return primero
        }
        return .test
    }
    
    func getWatchedAnimes() async {
        do {
            let watchedAnimes = try persistence.loadWatchedAnimes()
           
            await MainActor.run {
                self.watchedAnimes = watchedAnimes.sorted(by: { a1, a2 in
                    a1.title < a2.title
                })
           }
             
        } catch {
            self.watchedAnimes = []
        }
    }
    
    var ovas:[Anime] {
        watchedAnimes.filter { $0.type == .OVA}
    }
    
    var peliculas:[Anime] {
        watchedAnimes.filter { $0.type == .Pelicula }
    }
    
   var especial:[Anime] {
        watchedAnimes.filter { $0.type == .Especial }
    }
    
    var anime:[Anime] {
        watchedAnimes.filter { $0.type == .Anime}
    }
}
