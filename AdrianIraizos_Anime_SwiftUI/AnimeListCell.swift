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
                    .frame(width:100,height:150)
                    .multicolorGlow(size: 130)
                
            } placeholder: {
                Image(systemName: "film")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(height:150)
            }
            .offset(x:-30,y:30)
            VStack {
                Text(anime.title)
                    .font(.headline)
                    .foregroundColor(.offWhite)
                    .glow(color: .b13254, radius: 3)
                   
                Text(anime.type.rawValue)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(20)
                    .foregroundColor(.white)
                   
            }
            .offset(x:-50,y:30)
            
            
            VStack(alignment:.center) {
                Spacer()
                RatingView(rate: anime.rateDouble)
                Spacer()
                AnimeStatusView(status: anime.statusLetter)
                Spacer()
                AnimeTypeView(type: anime.typeLetter)
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "star.circle")
                }
                .buttonStyle(FavoriteButtonStyle())
            }
           
        }  .frame(idealWidth: .infinity)
    }
}

struct AnimeListCell_Previews: PreviewProvider {
    static var previews: some View {
        AnimeListCell(anime: .testLong)
    }
}


