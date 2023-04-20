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
        HStack(spacing:20) {
            AsyncImageNeumorphicStyle(imageURL: anime.image)
            VStack{
                Spacer()
                    Text(anime.title)
                        .font(.headline)
                        .foregroundColor(.darkStart)
                    
                    
                    Text(anime.type.rawValue)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                        .shadow(color: .black, radius: 0.5,x:0.5,y:0.5)
                
                
                Spacer()
                HStack(alignment:.center) {
                    Spacer()
                    RatingView(rate: anime.rateDouble)
                    
                    Spacer()
                    AnimeStatusView(status: anime.statusLetter)
                    Spacer()
                    AnimeTypeView(type: anime.typeLetter)
                    Spacer()
                    
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal)
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


