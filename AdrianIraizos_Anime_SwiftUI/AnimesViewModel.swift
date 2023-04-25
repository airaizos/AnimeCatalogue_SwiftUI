//
//  AnimesViewModel.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import Foundation

final class AnimesViewModel:ObservableObject {
    let persistence:Persistence
    
    @Published var loading:Bool
    var animes:[Anime]
    
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
    
    var sortedAscending = true
    
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
    
    @Published var recommendedGenre:String = "Aventuras"
    
    @Published var obraFilter:Obra = .All
    
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
    
    //¿Cómo se puede optimizar?
    var recommendedAnimes:[Anime] {
        let recommended = animes.filter { anime in
            if let genres = anime.genres {
                if genres.contains(recommendedGenre) {
                    return true
                }
            }
            return false
        }
            .shuffled()
        if recommended.count < 10 {
            return Array(recommended)
        } else {
            return Array(recommended.prefix(upTo: 10))
        }
    }
    
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
    
    func getListFor(type: Obra) -> [Anime] {
        switch type {
        case .OVA: return ovas
        case .Anime: return anime
        case .Pelicula: return peliculas
        case .Especial: return especial
        case .All: return animes
        }
    }
    
    //iPad
    
    var ovas:[Anime] {
       animes.filter { $0.type == .OVA}
    }
    
    var peliculas:[Anime] {
      animes.filter { $0.type == .Pelicula }
    }
    
   var especial:[Anime] {
       animes.filter { $0.type == .Especial }
    }
    
    var anime:[Anime] {
        animes.filter { $0.type == .Anime}
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
    
    @Published var watchedAnimes:[Anime] = []
    
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


