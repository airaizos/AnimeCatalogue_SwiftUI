//
//  ModelPersistence.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import Foundation

protocol Persistence {
    func loadWatchedAnimes() throws -> [Anime]
}

final class ModelPersistence:Persistence {
    static let shared = ModelPersistence()
    
    let fileLocation:FileLocation
    
    init(fileLocation:FileLocation = FileProduction()) {
        self.fileLocation = fileLocation
    }
    
    func loadAnimes() throws -> [Anime] {
        let data = try Data(contentsOf: fileLocation.fileURL)
        return try JSONDecoder().decode([Anime].self, from: data)
    }
    
    //MARK: Favorites
    let favoritesDocument = URL.documentsDirectory.appending(path:"favorites.json")
    
    func loadFavorites() throws -> [String] {
        guard FileManager.default.fileExists(atPath: favoritesDocument.path()) else { return [] }
        let data = try Data(contentsOf: favoritesDocument)
        return try JSONDecoder().decode(Favorites.self, from: data).ids
    }
    
    func saveFavorites(ids:[String]) throws {
        let favorites = Favorites(ids: ids)
        let data = try JSONEncoder().encode(favorites)
        try data.write(to: favoritesDocument, options: .atomic)
        
    }
    
    //MARK: Watched
    let watchedDocument = URL.documentsDirectory.appending(path: "watched.json")
    func loadWatched() throws -> [String] {
        guard FileManager.default.fileExists(atPath: watchedDocument.path()) else { return [] }
        let data = try Data(contentsOf: watchedDocument)
        return try JSONDecoder().decode(Watched.self, from: data).ids
    }
    func saveWatched(ids:[String]) throws {
        let watched = Watched(ids: ids)
        let data = try JSONEncoder().encode(watched)
        try data.write(to: watchedDocument, options: .atomic)
    }
    
    let watchedAnimesDocument = URL.documentsDirectory.appending(path: "watchedAnimes.json")

    func loadWatchedAnimes() throws -> [Anime] {
        guard FileManager.default.fileExists(atPath: watchedAnimesDocument.path()) else {  return [] }
        let data = try Data(contentsOf: watchedAnimesDocument)
        return try JSONDecoder().decode([Anime].self, from: data)
    }
    
    func saveWatchedAnimes(_ animes:[Anime]) throws {
        let data = try JSONEncoder().encode(animes)
        try data.write(to: watchedAnimesDocument, options: .atomic)
    }
    
}
