//
//  ModelPersistence.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import Foundation

protocol Persistence {
    func loadAnimes() throws -> [Anime]
    func loadWatchedAnimes() throws -> [Anime]
    func saveWatchedAnimes(_ animes:[Anime]) throws
}

class ModelPersistence: Persistence {
    static let shared = ModelPersistence()
    
    let fileLocation:FileLocation
    
    init(fileLocation:FileLocation = FileProduction()) {
        self.fileLocation = fileLocation
    }
    
    func loadAnimes() throws -> [Anime] {
        let data = try Data(contentsOf: fileLocation.fileAnimesURL)
        return try JSONDecoder().decode([Anime].self, from: data).sorted(by: { a1 , a2 in
            a1.title < a2.title
        })
    }
    
    //MARK: Watched
    func loadWatchedAnimes() throws -> [Anime] {
        //La preview no tiene acceso al FileManager
        guard FileManager.default.fileExists(atPath: fileLocation.fileWatchedURL.path()) else { return [] }
        let data = try Data(contentsOf: fileLocation.fileWatchedURL)
        return try JSONDecoder().decode([Anime].self, from: data)
    }
    
    func saveWatchedAnimes(_ animes:[Anime]) throws {
        let data = try JSONEncoder().encode(animes)
        try data.write(to: fileLocation.fileWatchedURL, options: .atomic)
    }
}
