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
    let statusIcon: String
    let typeIcon: String
    let imageURL: URL
    var body: some View {
        VStack{
            HStack {
                AsyncImageNeumorphicStyle(imageURL: imageURL)
                VStack{
                    Text(title)
                        .font(.title2)
                        .minimumScaleFactor(0.5)
                        .fontWeight(.light)
                        .foregroundColor(.darkStart)
                }
                .frame(maxWidth: .infinity)
            }
            HStack(alignment:.center,spacing: 0) {
                Spacer()
                Text(type.rawValue)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                    .shadow(color: .black, radius: 0.5,x:0.5,y:0.5)
                Spacer()
                AnimeStatusView(letter: "\(rate)")
                AnimeStatusView(letter: statusIcon)
                AnimeStatusView(letter: typeIcon)
            }
        }
        .padding()
        .background(LightBackground(isHighlighted: true, shape: RoundedRectangle(cornerRadius: 10)))
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


