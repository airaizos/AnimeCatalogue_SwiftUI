//
//  RecommendedAnime.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 18/4/23.
//

import SwiftUI

struct RecommendedAnime: View {
    var anime:Anime
    var body: some View {
        HStack {
            Text(anime.title)
                .font(.caption2)
                .foregroundColor(.secondary)
            AsyncImageNeumorphicStyle(imageURL: anime.image,width: 65,height: 90)
        }
        .frame(width: 200)
    }
}

struct RecommendedAnime_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedAnime(anime:.testLong)
    }
}
