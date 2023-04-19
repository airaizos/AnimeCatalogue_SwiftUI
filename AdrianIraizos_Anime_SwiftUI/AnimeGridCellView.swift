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
             //   .shadow(color: .offWhite, radius: 1, x: 1, y: 1)
                .frame(width:width)
                .bold()
                .multilineTextAlignment(.center)
            }

        .frame(width:width - 5)
    }
}

struct AnimeGridCellView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeGridCellView(anime:.testLong)
    }
}

struct GridBackground: View {
    var color:Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(color.opacity(0.3))
        
                .shadow(color: Color.white.opacity(0.9), radius: 10, x: -10, y: -10)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 10, y: 10)
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(color.opacity(0.4))
            
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(color.opacity(0.2))
                        .shadow(color: Color.white.opacity(0.9), radius: 10, x: -5, y: -5)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
                )
        }
    }
}
