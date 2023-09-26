//
//  AdrianIraizos_Anime_SwiftUITests.swift
//  AdrianIraizos_Anime_SwiftUITests
//
//  Created by Adrian Iraizos Mendoza on 25/4/23.
//

import XCTest
@testable import AdrianIraizos_Anime_SwiftUI

final class AdrianIraizos_Anime_SwiftUITests: XCTestCase {
    var persistence: ModelPersistence!
    var fileLocation: FileLocation!
 
  
    override func setUpWithError() throws {
        fileLocation = FileTests()
        persistence = PersistenceTest(fileLocation: fileLocation)
    }
    
    override func tearDown() {
        persistence = nil
        fileLocation = nil
    }
      
    func test_IsLoadingAnimes_ShouldBe6() throws  {
        let animes = try persistence.loadAnimes()
        
        XCTAssertEqual(animes.count, 6)
    }
    
 
    func test_IsLoading_WatchedAnimes() throws{
        let watched = try persistence.loadWatchedAnimes()
        
        XCTAssertEqual(watched.count, 4)
    }
  
    func test_IsSavingWatchedAnime_ShouldBe5() throws {
        var animes = try persistence.loadWatchedAnimes()
        
        let test = Anime.test
        animes.append(test)
        try persistence.saveWatchedAnimes(animes)
        let nuevosAnimes = try persistence.loadWatchedAnimes()
        
        XCTAssertTrue(nuevosAnimes.contains(test))
        XCTAssertEqual(animes.count, nuevosAnimes.count)
    }
}
