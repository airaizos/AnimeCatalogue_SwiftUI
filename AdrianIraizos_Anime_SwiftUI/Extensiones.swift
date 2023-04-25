//
//  Extensiones.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI

extension Color {
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue:  30 / 255)
    
    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
    
    static let offWhite = Color(red: 225 / 255, green: 225 / 255 , blue: 235 / 255)
    
    
    static let b13254 = Color(red: 0.694, green: 0.196, blue: 0.329)
    
    static let b471337 = Color(red:0.278, green:0.075, blue:0.216)
    
    
    static let pinkStart = Color(red: 0.929, green: 0.263, blue: 0.682)
    static let pinkEnd = Color(red: 0.800, green: 0.278, blue: 0.557)
}


extension UIDevice {
    static var bounds:CGRect {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?
            .frame ?? .zero
    }
}

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
