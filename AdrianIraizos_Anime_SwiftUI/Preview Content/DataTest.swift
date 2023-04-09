//
//  DataTest.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import Foundation

struct FilePreview:FileLocation {
    var fileURL: URL {
        Bundle.main.url(forResource: "AnimeTest", withExtension: "json")!
    }
}

extension Anime {
    static let preview = FilePreview()
    static let animePreview = AnimesViewModel(persistence: ModelPersistence(fileLocation: FilePreview()))
}


extension AnimesViewModel {
    static let animesPreview = AnimesViewModel(persistence: ModelPersistence(fileLocation: FilePreview()))
}
