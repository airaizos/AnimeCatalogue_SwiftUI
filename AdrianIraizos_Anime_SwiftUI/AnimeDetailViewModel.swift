//
//  AnimeDetailViewModel.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 12/4/23.
//

import Foundation
final class AnimeDetailViewModel:ObservableObject {
    
    let persistence:ModelPersistence
    @Published var anime:Anime
    @Published var isFavorite:Bool
    @Published var isWatched:Bool
    
    init(anime:Anime, persistence:ModelPersistence = .shared) {
        self.anime = anime
        self.persistence = persistence
        
        do {
            self.favorites = try persistence.loadFavorites()
            self.watched = try persistence.loadWatched()
        } catch {
            self.favorites = []
            self.watched = []
        }
        
        self.isFavorite = favorites.contains(anime.id)
        self.isWatched = watched.contains(anime.id)
        
    }
    
    
    func upAndDownText(_ txt: String) -> AttributedString {
        var result = AttributedString()
        
        for (index,letter) in txt.enumerated() {
            var letterString = AttributedString(String(letter))
            letterString.baselineOffset = sin(Double(index)) * 2
            result += letterString
        }
        result.font = .largeTitle
        return result
    }
    
    //Favorite
    private var favorites:[String] {
        didSet {
            try? persistence.saveFavorites(ids: favorites)
        }
    }
    
    func toggleFavorite(anime:Anime) {
        switch favorites.contains(anime.id) {
        case true: favorites.removeAll() { $0 == anime.id }
        case false: favorites.append(anime.id)
        }
    }
    
    func isFavorite(anime:Anime) -> Bool {
        favorites.contains(anime.id)
    }
    //Watched
    private var watched:[String] {
        didSet {
            try? persistence.saveWatched(ids: watched)
        }
    }
    
    func isWatched(anime:Anime) -> Bool {
        watched.contains(anime.id)
    }
    
    func toggleWatched(anime:Anime) {
        switch watched.contains(anime.id) {
        case true: watched.removeAll() { $0 == anime.id }
        case false: watched.append(anime.id)
        }
    }
}

