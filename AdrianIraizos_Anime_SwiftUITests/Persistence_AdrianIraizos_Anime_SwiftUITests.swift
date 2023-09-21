//
//  AdrianIraizos_Anime_SwiftUITests.swift
//  AdrianIraizos_Anime_SwiftUITests
//
//  Created by Adrian Iraizos Mendoza on 25/4/23.
//

import XCTest
@testable import AdrianIraizos_Anime_SwiftUI

final class AdrianIraizos_Anime_SwiftUITests: XCTestCase {
    var persistence:ModelPersistence!
 
    
    override func setUp() {
        persistence = PersistenceTest(fileLocation: FilePreview())
    }
  
    override func setUpWithError() throws {
        persistence = PersistenceTest(fileLocation: FilePreview())
    }
    
    override func tearDown() {
        persistence = nil
    }
      
    //loadAnimes 6
    func testIsLoadingSixAnimes() throws  {
        let animes = try persistence.loadAnimes()
        XCTAssertEqual(animes.count, 6)
    }
    
    //loadWatchesAnimes 4
    func testIsLoadingFourWatchedAnimes() throws{
        let watched = try persistence.loadWatchedAnimes()
        XCTAssertEqual(watched.count, 4)
        
    }
    
    //saveWatchedAnimes
    func testIsSavingFiveWatchedAnime() throws {
        var animes = try persistence.loadWatchedAnimes()
        let test = Anime.test
        animes.append(test)
        try persistence.saveWatchedAnimes(animes)
        let nuevosAnimes = try persistence.loadWatchedAnimes()
        XCTAssertTrue(nuevosAnimes.contains(test))
        XCTAssertEqual(animes, nuevosAnimes)
    }
    
}
