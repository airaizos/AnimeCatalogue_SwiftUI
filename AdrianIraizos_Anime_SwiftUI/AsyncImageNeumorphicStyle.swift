//
//  AsyncImageNeumorphicStyle.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 17/4/23.
//

import SwiftUI

struct AsyncImageNeumorphicStyle: View {
    var imageURL:URL
    var width:CGFloat = 150
    var height:CGFloat = 210
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.offWhite)
                .shadow(color:Color.black.opacity(0.2), radius: 10, x:10, y:10)
                .shadow(color:Color.white.opacity(0.7), radius: 10, x:5, y:5)
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(.black.opacity(0.5), lineWidth: 9)
                            .blendMode(.overlay)
                    }
                    
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                
                    .shadow(color: .black.opacity(0.6), radius: 10, x:10,y:10)
                    .frame(width:width, height: height)
            } placeholder: {
                Image(systemName: "film")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
            }
        }
        .frame(width:width + 5, height: height + 5)
    }
}

struct AsyncImageNeumorphicStyle_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageNeumorphicStyle(imageURL: URL(string:"https://www3.animeflv.net/uploads/animes/covers/1115.jpg")!)
    }
}
