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
    
    init(persistence:ModelPersistence = .shared) {
        self.persistence = persistence
        do {
            self.animes = try persistence.loadAnimes()
           
        } catch {

            self.animes = []
        }
    }
    
}
