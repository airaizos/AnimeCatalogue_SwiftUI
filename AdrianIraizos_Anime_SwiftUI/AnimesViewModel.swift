//
//  AnimesViewModel.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import Foundation

final class AnimesViewModel: ObservableObject {
    let persistence: Persistence
    var animes:[Anime]
    var sortedAscending = true
    
    var animesSearch:[Anime] {
        
        animesFilter.filter { anime in
            switch search.isEmpty {
            case true: return true
            case false: return anime.searchableInfo.lowercased().contains(search.lowercased())
            }
        }
        .sortAnime(sorted: sorted, sortedAscending: sortedAscending)
    }
    
    var animesFilter:[Anime] {
        animes.filter { anime in
            switch obraFilter {
            case .OVA: return anime.type == .OVA
            case .Anime: return anime.type == .Anime
            case .Pelicula: return anime.type == .Pelicula
            case .Especial: return anime.type == .Especial
            case .All: return true
            }
        }
    }
    
    private var genres:Set<String> {
        var generos:Set<String> = []
        animes.compactMap(\.genres).forEach { varios in
            let parts  = varios.split(separator: ",")
            parts.forEach { genre in
                generos.insert(String(genre))
            }
        }
        return generos
    }
    
    
    func filterBy(_ type:Obra) -> [Anime] {
        animes.filter { $0.type == type }
    }
    
    var ovas:[Anime] { filterBy(.OVA) }
    
    var peliculas:[Anime] { filterBy(.Pelicula) }
    
    var especial:[Anime] { filterBy(.Especial) }
    
    var anime:[Anime] { filterBy(.Anime) }
    
    var recommendedAnimes:[Anime] {
        let recommended = animes.filter { anime in
            if let genres = anime.genres, genres.contains(recommendedGenre) {
                    return true
            }
            return false
        }
            .shuffled()
        
        return recommended.count < 10 ? Array(recommended) : Array(recommended.prefix(upTo: 10))
    }
    
    @Published var loading:Bool
    @Published var search = ""
    @Published var sorted = SortedBy.title {
        didSet {
            sortedAscending.toggle()
            UserDefaults.standard.set(sorted.rawValue, forKey: "sortedBy")
            UserDefaults.standard.set(sortedAscending,forKey: "sortedAscending")
            watchedAnimes = watched.sortAnime(sorted: sorted, sortedAscending: sortedAscending)
        }
    }
    @Published var obraPicker = 0 {
        didSet {
            switch obraPicker {
            case 1: obraFilter = .OVA
            case 2: obraFilter = .Pelicula
            case 3: obraFilter = .Especial
            case 4: obraFilter = .Anime
            default: obraFilter = .All
            }
        }
    }
    @Published var recommendedGenre:String = "Aventuras"
    @Published var obraFilter:Obra = .All
    @Published var watchedAnimes:[Anime] = []
    
    //MARK: - Init
    init(persistence:ModelPersistence = .shared) {
        self.persistence = persistence
        self.loading = true
        self.animes = []
        self.watched = []
        
        //Habria que hacer dos independientes para que en cada vista persistiera su propio orden
        if let sortedBy = SortedBy(rawValue: UserDefaults.standard.object(forKey: "sortedBy") as? String ?? "Title"), let sortedA = UserDefaults.standard.object(forKey: "sortedAscending") as? Bool {
            sorted = sortedBy
            sortedAscending = sortedA
        }
        
        Task {
            await getData()
            await getWatchedAnimes()
            await MainActor.run {
                self.loading = false
            }
        }
    }
    
    //Detail
    func upAndDownText(_ txt: String) -> AttributedString {
        var result = AttributedString()
        
        for (index,letter) in txt.enumerated() {
            var letterString = AttributedString(String(letter))
            letterString.baselineOffset = sin(Double(index)) * 2
            result += letterString
        }
        result.font = .largeTitle
        return result
    }
    
    func toggleWatched(anime:Anime) {
        switch watched.contains(anime) {
        case true: watched.removeAll() { $0 == anime }
        case false: watched.append(anime)
        }
    }
    
    func isWatched(anime:Anime) -> Bool {
        watched.contains(anime)
    }

    func getData() async {
        do {
            let animes = try persistence.loadAnimes()
            if let recommended = genres.randomElement() {
                await MainActor.run {
                    self.recommendedGenre = recommended
                }
            }
            await MainActor.run {
                self.animes = animes.sorted { $0.title < $1.title}
            }
        } catch {
            self.animes = []
        }
    }
    
    
    //Watched
    var watched:[Anime] {
        didSet {
            watchedAnimes = watched.sortAnime(sorted: sorted, sortedAscending: sortedAscending)
            do {
                try persistence.saveWatchedAnimes(watched)
            } catch {
                print("error")
            }
        }
    }
    
    func getWatchedAnimes() async {
        do {
            let loadedWatchedAnimes = try persistence.loadWatchedAnimes()
            
            await MainActor.run {
                self.watched = loadedWatchedAnimes.sorted(by: { a1, a2 in
                    a1.title < a2.title
                })
            }
        } catch {
            self.watched = []
        }
    }
}


