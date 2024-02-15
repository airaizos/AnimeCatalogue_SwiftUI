//
//  AnimeListCell.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI

struct AnimeListCell: View {
    let title: String
    let type: Obra
    let rate: Double
    let statusIcon: IconLabel
    let typeIcon: IconLabel
    let imageURL: URL
    var body: some View {
        HStack(spacing:20) {
            AsyncImageNeumorphicStyle(imageURL: imageURL)
            VStack{
                Spacer()
                    Text(title)
                        .font(.title2)
                        .fontWeight(.light)
                        .foregroundColor(.darkStart)
                    Text(type.rawValue)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                        .shadow(color: .black, radius: 0.5,x:0.5,y:0.5)
                Spacer()
                HStack(alignment:.center) {
                    RatingView(rate: rate,isGray: false)
                    
                    Spacer()
                    AnimeStatusView(statusIcon: statusIcon)
                    Spacer()
                    AnimeTypeView(iconLabel: typeIcon)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal)
    }
}


extension AnimeListCell {
    init(anime:Anime) {
        title = anime.title
        type = anime.type
        rate = anime.rateDouble
        statusIcon = anime.statusIcon
        typeIcon = anime.typeIcon
        imageURL = anime.image
    }
}
struct AnimeListCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AnimeListCell(anime: .testLong)
                .frame(width: .infinity, height: 300)
            Spacer()
        }
    }
}


