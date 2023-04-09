//
//  ModelPersistence.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import Foundation


final class ModelPersistence {
    static let persistence = ModelPersistence()
    
    let filetBundleURL = Bundle.main.url(forResource: "anime", withExtension: "json")!
    
    func getAnimes() throws -> [Anime] {
        let data = try Data(contentsOf: filetBundleURL)
        return try JSONDecoder().decode([Anime].self, from: data)
    }
}
