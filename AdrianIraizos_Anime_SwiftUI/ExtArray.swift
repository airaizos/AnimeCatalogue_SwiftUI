//
//  ExtArray.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 22/9/23.
//

import Foundation

extension Array where Element == Anime {
    func sortAnime(sorted: SortedBy, sortedAscending: Bool) -> [Anime] {
        self.sorted { a1, a2 in
            switch sorted {
            case .title: if sortedAscending { return a1.title < a2.title } else { return a1.title > a2.title }
            case .year: if sortedAscending { return a1.year < a2.year } else { return a2.year > a2.year }
            case .rate: if sortedAscending { return a1.rate < a2.rate } else { return a1.rate > a2.rate }
            case .followers: if sortedAscending { return a1.followers < a2.followers } else { return a1.followers > a2.followers }
            case .episodes: if sortedAscending { return a1.episodes < a2.episodes } else { return a1.episodes > a2.episodes }
            case .votes: if sortedAscending { return a1.votes ?? 0 < a2.votes ?? 0 } else { return a1.votes ?? 0 > a2.votes ?? 0 }
            }
        }
    }
}
