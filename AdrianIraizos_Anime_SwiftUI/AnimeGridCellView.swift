//
//  AnimeGridCellView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 18/4/23.
//

import SwiftUI

struct AnimeGridCellView: View {
    let anime:Anime
    private let width:CGFloat = 75
    private let height:CGFloat = 105
    var titleColor:Color = .gray
    var infoSize:InfoSize = .small
    var body: some View {
        VStack(alignment:.center,spacing: 10){
            AsyncImageNeumorphicStyle(imageURL: anime.image,width: width * infoSize.rawValue,height: height * infoSize.rawValue)
                Text(anime.title)
                .font(infoSize.fontSize)
                .lineLimit(4,reservesSpace: true)
                .foregroundColor(titleColor)
                .frame(width:width * infoSize.rawValue)
                .bold()
                .multilineTextAlignment(.center)
            }
    }
}

struct AnimeGridCellView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeGridCellView(anime:.testLong,infoSize: .extra)
    }
}
