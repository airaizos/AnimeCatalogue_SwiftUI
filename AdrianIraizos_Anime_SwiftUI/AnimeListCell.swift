//
//  AnimeListCell.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI

struct AnimeListCell: View {
    let anime:Anime
    var body: some View {
        HStack {
            AsyncImage(url: anime.image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .clipShape(Rhomboid())
                    .rotationEffect(Angle(degrees: -10))
                    .cornerRadius(200)
                    .frame(height:150)

            } placeholder: {
                Image(systemName: "film")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(height:150)
            }
            VStack(alignment:.leading,spacing: 10) {
                Text(anime.title)
                    .font(.headline)
                Text(anime.type.rawValue)
                    .font(.subheadline)
                RatingView(rate: anime.rateDouble)
                    .offset(x:15)
                Text(anime.status.rawValue)
                    .font(.callout)
            }
            Spacer()
        }  .frame(idealWidth: .infinity)
    }
}

struct AnimeListCell_Previews: PreviewProvider {
    static var previews: some View {
        AnimeListCell(anime: .test)
    }
}


