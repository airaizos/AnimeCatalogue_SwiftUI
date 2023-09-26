//
//  ViewModel_AdrianIraizos_Anime_SwiftUITests.swift
//  AdrianIraizos_Anime_SwiftUITests
//
//  Created by Adrian Iraizos Mendoza on 25/4/23.
//

import XCTest
@testable import AdrianIraizos_Anime_SwiftUI

final class ViewModel_Anime_Tests: XCTestCase {
    var persistence: ModelPersistence!
    var vm: AnimesViewModel!
    var fileLocation: FileLocation!
    
   override func setUpWithError() throws {
        
        fileLocation = FileTests()
        persistence = PersistenceTest(fileLocation: fileLocation)
        vm = AnimesViewModel(persistence: persistence)
        
    }
    
    override func tearDown() {
        fileLocation = nil
        persistence = nil
        vm = nil
    }

    func test_IsWatched_ShouldBeFalse() {
        let animeNotWatched = Anime.test
        
        XCTAssertFalse(vm.isWatched(anime: animeNotWatched))
    }
    
    func test_IsWached_ShouldBe_True() async throws {
       
        vm.toggleWatched(anime: .watched)

    
        XCTAssertTrue(vm.isWatched(anime: .watched))
    }
    
    func test_Sorting_ShouldBeEqual() {
        let animesSortedByTitleSortedAscendingFalse:[Anime] = [.test,.testShort,.testLong]
        let animes:[Anime] = [.test,.testLong,.testShort]
        
        .sortAnime(sorted: .title, sortedAscending: true)
        
        XCTAssertEqual(animesSortedByTitleSortedAscendingFalse, animes)
        
    }
  
    //Variables calculadas
    func test_RecommendedAnimes_ShouldBe2() {
        vm.recommendedGenre = "Comedia"
        vm.animes = [.test,.testLong,.testShort]
        XCTAssertEqual(vm.recommendedAnimes.count, 2)
        
    }
    
    func test_IsFilteringByObraOVA_ShouldBe2() async {
        await vm.getData()
        vm.obraFilter = .OVA
        
        XCTAssertEqual(vm.animesFilter.count,2)
        
    }
    
    func test_IsFilteringBySearch_ShouldBe1() async {
        await vm.getData()
        vm.obraFilter = .OVA
        vm.search = "Freezer"
        
        XCTAssertEqual(vm.animesSearch.count, 1)
    }
    
    func test_Genres_ShouldBe11() async {
        await vm.getData()
        XCTAssertEqual(vm.genres.count,11)
    }
    
    func test_FilterBy_ShouldBe2() async {
        await vm.getData()
        let filterCount = vm.filterBy(.OVA).count
        
        XCTAssertEqual(filterCount, 2)
    }
    
    func test_Ovas_ShouldBe2() async {
        await vm.getData()
        XCTAssertEqual(vm.ovas.count,2)
    }
    
    func test_Peliculas_ShoudlBe0() {
        XCTAssertEqual(vm.peliculas.count, 0)
        
    }
    
    func test_Especial_ShouldBe0() {
        XCTAssertEqual(vm.especial.count, 0)
    }
    
    func test_Anime_ShouldBe() async {
        await vm.getData()
        XCTAssertEqual(vm.anime.count, 4)
    }
    
    func test_RecommendedAnimes_() async {
        await vm.getData()
        vm.recommendedGenre = "Comedia"
        
        let recommendedCount = vm.recommendedAnimes.count
        
        XCTAssertEqual(recommendedCount, 3)
    }
    
    func test_ToggleWatched_ShouldBeTrue() {
        vm.watched.removeAll()
        
        vm.toggleWatched(anime: .test)
        
        XCTAssertTrue(vm.watched.contains(.test))
        
    }
    
    func test_ToggleWatched_ShouldBeFalse() {
        vm.watched.removeAll()
        
        vm.toggleWatched(anime: .test)
        XCTAssertTrue(vm.watched.contains(.test))
        
      
        vm.toggleWatched(anime: .test)
        XCTAssertFalse(vm.watched.contains(.test))
    }
    
    func test_IsWatched_ShoudlBeFalse() {
        XCTAssertFalse(vm.isWatched(anime: .test))
        
    }
    
    
    func test_GetData_() async throws {
      
        await vm.getData()
        
        XCTAssertEqual(vm.animes.count,6)
        
        let first = try XCTUnwrap(vm.animes.first)
        
        XCTAssertEqual(first.title, "Akane Maniax")
        
        XCTAssertNotNil(vm.recommendedGenre)
        
        
        
    }
    
}
