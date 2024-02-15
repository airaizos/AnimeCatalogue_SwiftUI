//
//  AnimeGridCellView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 18/4/23.
//

import SwiftUI

struct AnimeGridCellView: View {
    let title: String
    let imageURL: URL
    private let width:CGFloat = 75
    private let height:CGFloat = 105
    var infoSize:InfoSize = .small
    var body: some View {
        VStack(alignment:.center,spacing: 10){
            AsyncImageNeumorphicStyle(imageURL: imageURL,
                                      width: width * infoSize.rawValue,
                                      height: height * infoSize.rawValue)
                Text(title)
                .font(infoSize.fontSize)
                .lineLimit(4,reservesSpace: true)
                .foregroundColor(.gray)
                .frame(width:width * infoSize.rawValue)
                .bold()
                .multilineTextAlignment(.center)
            }
    }
}

extension AnimeGridCellView {
    init(anime: Anime, infoSize: InfoSize) {
        title = anime.title
        imageURL = anime.image
        self.infoSize = infoSize
    }
}


struct AnimeGridCellView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeGridCellView(anime:.testLong,infoSize: .extra)
    }
}
