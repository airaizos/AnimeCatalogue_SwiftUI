//
//  AnimeGridCellView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 18/4/23.
//

import SwiftUI

struct AnimeGridCellView: View {
    let anime:Anime
    let width:CGFloat = 80
    var titleColor:Color = .gray
    var body: some View {
        VStack(alignment:.center,spacing: 10){
            AsyncImageNeumorphicStyle(imageURL: anime.image,width: 75,height: 105)
                Text(anime.title)
                .font(.footnote)
                .lineLimit(5)
                .foregroundColor(titleColor)
                .frame(width:width)
                .bold()
                .multilineTextAlignment(.center)
                .lineLimit(3, reservesSpace: true)
            }
        .frame(width:width - 5,alignment: .top)
    }
}

struct AnimeGridCellView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeGridCellView(anime:.testLong)
    }
}
