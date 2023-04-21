//
//  ModeloColumnas.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 21/4/23.
//

import SwiftUI

final class ModeloColumnas: ObservableObject {
    @Published var gridItem = [GridItem()]
    @Published var grids = 3
    @Published var size:infoSize = .medium
    
    private let flexibleGridItem = GridItem(.flexible(minimum: 70, maximum: 300))
    
    init() {
        if let num = UserDefaults.standard.object(forKey: "numColumnsWatched") as? Int {
            gridItem = Array(repeating: flexibleGridItem, count: num)
        } else {
            gridItem = Array(repeating: flexibleGridItem, count: grids)
        }
    }
    
    
    func setGridNum(_ cant:Int) {
        setGridSize(cant)
        gridItem = Array(repeating: flexibleGridItem, count: cant)
        UserDefaults.standard.set(cant, forKey: "numColumnsWatched")
    }
    
    func setGridSize(_ cant:Int) {
        switch cant {
        case 1: size = .extra
        case 2: size = .large
        case 4: size = .small
        default: size = .medium
        }
    }
}
