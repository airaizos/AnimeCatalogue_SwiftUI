//
//  AnimeViewModelTest.swift
//  AdrianIraizos_Anime_SwiftUITests
//
//  Created by Adrian Iraizos Mendoza on 26/9/23.
//

import Foundation

@testable import AdrianIraizos_Anime_SwiftUI
final class AnimesViewModelTest: AnimesViewModel {
    
    
    override init(persistence: ModelPersistence = PersistenceTest(fileLocation: FileTests())) {
       super.init()
        do {
            animes = try persistence.loadAnimes()
        } catch {
            animes = []
        }
    }
    
}
