//
//  AnimesViewModel.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import Foundation

final class AnimesViewModel:ObservableObject {
    let persistence:ModelPersistence
    
    @Published var animes:[Anime]
    @Published var search = ""
    @Published var sorted = SortedBy.none
    @Published var obraPicker = 0 {
        didSet {
            switch obraPicker {
            case 1: obraFilter = .OVA
            case 2: obraFilter = .Pelicula
            case 3: obraFilter = .Especial
            case 4: obraFilter = .Anime
            default: obraFilter = .All
            }
        }
    }
     private var obraFilter:Obra = .All
    
    var animesSearch:[Anime] {
        
        animesFilter.filter { anime in
            switch search.isEmpty {
            case true: return true
            case false: return anime.searchableInfo.lowercased().contains(search.lowercased())
            }
        } .sorted { a1, a2 in
            switch sorted {
            case .none: return true
            case .titleA: return a1.title < a2.title
            case .titleD: return a1.title > a2.title
            case .yearA: return a1.year < a2.year
            case .yearD: return a2.year > a2.year
            case .rateA: return a1.rate < a2.rate
            case .rateD: return a1.rate > a2.rate
            case .followersA: return a1.followers < a2.followers
            case .followersD: return a1.followers > a2.followers
            case .episodesA: return a1.episodes < a2.episodes
            case .episodesD: return a1.episodes > a2.episodes
            case .votesA: return a1.votes ?? 0 < a2.votes ?? 0
            case .votesD: return a1.votes ?? 0 > a2.votes ?? 0
            }
        }
    }
    
    var animesFilter:[Anime] {
        animes.filter { anime in
            switch obraFilter {
            case .OVA: return anime.type == .OVA
            case .Anime: return anime.type == .Anime
            case .Pelicula: return anime.type == .Pelicula
            case .Especial: return anime.type == .Especial
            case .All: return true
            }
        }
    }
    
    
    init(persistence:ModelPersistence = .shared) {
        self.persistence = persistence
        do {
            self.animes = try persistence.loadAnimes()
           
        } catch {

            self.animes = []
        }
    }
    
}
