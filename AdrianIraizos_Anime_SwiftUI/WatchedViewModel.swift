//
//  WatchedViewModel.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 18/4/23.
//

import Foundation


final class WatchedViewModel:ObservableObject {
    
    let persistence:ModelPersistence
    var watchedAnimes:[Anime]
    
    
    init(persistence:ModelPersistence = .shared) {
        self.persistence = persistence
        self.watchedAnimes = []
        
    }
    
}
