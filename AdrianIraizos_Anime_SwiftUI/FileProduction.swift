//
//  FileProduction.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import Foundation

struct FileProduction:FileLocation {
 var fileAnimesURL: URL {
        Bundle.main.url(forResource: "anime", withExtension: "json")!
    }
    var fileWatchedURL: URL {
        URL.documentsDirectory.appending(path: "watchedAnimes.json")
    }
}
