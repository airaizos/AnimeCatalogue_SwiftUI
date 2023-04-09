//
//  ModelPersistence.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import Foundation


final class ModelPersistence {
    static let shared = ModelPersistence()
    
    let fileLocation:FileLocation
    
    init(fileLocation:FileLocation = FileProduction()) {
        self.fileLocation = fileLocation
    }
    
    func loadAnimes() throws -> [Anime] {
        let data = try Data(contentsOf: fileLocation.fileURL)
        return try JSONDecoder().decode([Anime].self, from: data)
    }
}
