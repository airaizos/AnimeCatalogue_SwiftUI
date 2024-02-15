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

                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 4)
                        .blur(radius: 4)
                        .offset(x: 5, y: 5)
                        .mask(RoundedRectangle(cornerRadius: 12).fill(LinearGradient(colors: [Color.black,Color.black,Color.clear], startPoint: .topLeading, endPoint: .bottomTrailing)))
                    )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 1)
                        .blur(radius: 1)
                        .offset(x: -10, y: -10)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                )
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .frame(width: width, height: height)
            } placeholder: {
                Image("placeholder")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
            }
        }

        .frame(width:width + 10, height: height + 10)
    }
}

struct AsyncImageNeumorphicStyle_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageNeumorphicStyle(imageURL: URL(string:"https://www3.animeflv.net/uploads/animes/covers/1115.jpg")!)
        //https://www3.animeflv.net/uploads/animes/covers/1115.jpg
    }
}
