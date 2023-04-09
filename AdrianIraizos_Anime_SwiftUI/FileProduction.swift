//
//  FileProduction.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import Foundation

struct FileProduction:FileLocation {
    var fileURL: URL {
        Bundle.main.url(forResource: "anime", withExtension: "json")!
    }
}
