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
        
        self.isFavorite = favorites.contains(anime.idHash)
        self.isWatched = watched.contains(anime.idHash)
        
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
    
    func toggleFavorite(idHash:String) {
        switch favorites.contains(idHash) {
        case true: favorites.removeAll() { $0 == idHash }
        case false: favorites.append(idHash)
        }
    }
    
    //Watched
    private var watched:[String] {
        didSet {
            try? persistence.saveWatched(ids: watched)
        }
    }
    
    func isWatched(idHash:String) -> Bool {
        watched.contains(idHash)
    }
    
    func toggleWatched(idHash:String) {
        switch watched.contains(idHash) {
        case true: watched.removeAll() { $0 == idHash }
        case false: watched.append(idHash)
        }
    }
}

