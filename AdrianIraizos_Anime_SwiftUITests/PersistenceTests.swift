//
//  PersistenceTests.swift
//  AdrianIraizos_Anime_SwiftUITests
//
//  Created by Adrian Iraizos Mendoza on 25/9/23.
//

import Foundation

@testable import AdrianIraizos_Anime_SwiftUI
final class PersistenceTest:ModelPersistence {
    static let sharedTest = PersistenceTest(fileLocation: FileTests())

    override func loadAnimes() throws -> [Anime] {
        
           let data = try Data(contentsOf: fileLocation.fileAnimesURL)
           return try JSONDecoder().decode([Anime].self, from: data)
       }
    
    override func loadWatchedAnimes() throws -> [Anime] {
    
        let data = try Data(contentsOf: fileLocation.fileWatchedURL)
        return try JSONDecoder().decode([Anime].self, from: data)
    }
}
