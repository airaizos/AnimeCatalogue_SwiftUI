//
//  ViewModel_AdrianIraizos_Anime_SwiftUITests.swift
//  AdrianIraizos_Anime_SwiftUITests
//
//  Created by Adrian Iraizos Mendoza on 25/4/23.
//

import XCTest
@testable import AdrianIraizos_Anime_SwiftUI

final class ViewModel_AdrianIraizos_Anime_SwiftUITests: XCTestCase {
    var persistence: ModelPersistence!
    var vm: AnimesViewModel!
    
    override func setUp() {
        persistence = PersistenceTest()
        vm = AnimesViewModel(persistence:persistence)
    }
    
    override func tearDown() {
        persistence = nil
        vm = nil
    }
    
    //isWatched
    func test_IsWached_ShouldBeFalse() {
        let animeNotWatched = Anime.test
        XCTAssertFalse(vm.isWatched(anime: animeNotWatched))
    }
    
    func test_IsWached_ShouldBe_True() async throws {
        await vm.getData()
        vm.watched.append(.watched)
    
        XCTAssertTrue(vm.isWatched(anime: .watched))
    }
    
    //sortedAscending
    func test_Sorting_ShouldBeEqual() {
        var animesSortedByTitleSortedAscendingFalse:[Anime] = [.test,.testShort,.testLong]
        var animes:[Anime] = [.test,.testLong,.testShort]
        .sortAnime(sorted: .title, sortedAscending: true)
        XCTAssertEqual(animesSortedByTitleSortedAscendingFalse, animes)
        
    }
  
    //Variables calculadas
    func test_RecommendedAnimes_ShouldBe2() {
        vm.recommendedGenre = "Comedia"
        vm.animes = [.test,.testLong,.testShort]
        XCTAssertEqual(vm.recommendedAnimes.count, 2)
        
    }
}
