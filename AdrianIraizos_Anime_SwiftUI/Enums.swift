//
//  Enums.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

enum SortedBy:String,CaseIterable,Identifiable {

    var id:SortedBy { self }
    case none = "None"
    case titleA = "Title ⇈", titleD = "Title ⇊"
    case yearA = "Year ⇈", yearD = "Year ⇊"
    case rateA = "Rate ⇈", rateD = "Rate ⇊"
    case followersA = "Followers ⇈", followersD = "Followers ⇊"
    case episodesA = "Episodes ⇈", episodesD = "Episodes ⇊"
    case votesA = "Votes ⇈", votesD = "Votes ⇊"
}

enum infoSize:CGFloat {
    case small = 1
    case medium = 1.5
    case large = 2
    case extra = 4
    
    var fontSize:Font {
        switch self {
        case .small: return .caption2
        case .medium: return .body
        case .large: return .subheadline
        case .extra: return .largeTitle
        }
    }
}

enum NavigationState {
    case splash, welcome, home
}
