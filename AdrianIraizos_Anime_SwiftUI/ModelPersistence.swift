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
        return try JSONDecoder().decode([Anime].self, from: data).sorted(by: { a1 , a2 in
            a1.title < a2.title
        })
    }
    
    //MARK: Watched
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
