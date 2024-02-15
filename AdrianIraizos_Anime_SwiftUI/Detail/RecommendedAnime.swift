//
//  RecommendedAnime.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 18/4/23.
//

import SwiftUI

struct RecommendedAnime: View {
    let title: String
    let imageURL: URL
    
    var body: some View {
        VStack {
            AsyncImageNeumorphicStyle(imageURL: imageURL,width: 65,height: 90)
            Text(title)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .frame(width: 100)
    }
}

extension RecommendedAnime {
    init(anime: Anime) {
        title = anime.title
        imageURL = anime.image
    }
}

struct RecommendedAnime_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedAnime(anime:.testLong)
    }
}
