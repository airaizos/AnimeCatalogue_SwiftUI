//
//  RecommendedAnimesList.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 15/2/24.
//

import SwiftUI

struct RecommendedAnimesList: View {
    let animes: [Anime]
    var body: some View {
        VStack(alignment: .leading,spacing:5) {
            Text("recommended for you")
                .modifier(detailLabel())
                .padding(.horizontal)
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(alignment: .firstTextBaseline) {
                    ForEach(animes) { recommendend in
                        NavigationLink(value: recommendend) {
                            RecommendedAnime(anime: recommendend)
                                .padding(.vertical,30)
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    RecommendedAnimesList(animes:  Anime.samples)
}
