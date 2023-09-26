//
//  FileTests.swift
//  AdrianIraizos_Anime_SwiftUITests
//
//  Created by Adrian Iraizos Mendoza on 25/9/23.
//

import Foundation

@testable import AdrianIraizos_Anime_SwiftUI
struct FileTests: FileLocation {
    
    let bundle = Bundle(for: AdrianIraizos_Anime_SwiftUITests.self)
    
    var fileAnimesURL: URL {
        bundle.url(forResource: "animeTest", withExtension: "json")!
    }
    var fileWatchedURL: URL {
        bundle.url(forResource: "watchedTest", withExtension: "json")!
    }
}
