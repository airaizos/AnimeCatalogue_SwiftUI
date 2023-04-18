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
            AsyncImage(url: anime.image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .opacity(0.8)
            } placeholder: {
                Image(systemName: "popcorn")
            }
            .cornerRadius(12)
        }
        .frame(width: 190, height: 90)
    }
}

struct RecommendedAnime_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedAnime(anime:.testLong)
    }
}
