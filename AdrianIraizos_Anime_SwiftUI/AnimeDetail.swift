//
//  AnimeDetail.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct AnimeDetail: View {
    var anime:Anime
    var body: some View {
        VStack {
            Text(anime.title)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            HStack {
                AsyncImage(url: anime.image) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                } placeholder: {
                    Image(systemName: "popcorn")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                }
                VStack(alignment:.leading) {
                    HStack {
                        VStack {
                            Text("year")
                            Text("\(anime.year)")
                        }
                        VStack {
                            Text("type")
                            Text(anime.type.rawValue)
                        }
                        VStack {
                            Text("status")
                            Text(anime.status.rawValue)
                        }
                    }
                    .padding(.vertical)
                        VStack {
                            Text("episodes")
                            Text("\(anime.episodes)")
                        
                    }
                    
                }
            }
            HStack {
                VStack {
                    Text("Followers")
                    Text("\(anime.followers)")
                }
                VStack {
                    Text("Votes")
                    Text("\(anime.votes ?? 0)")
                }
                VStack {
                    Text("Rate")
                    Text(anime.rate)
                }
            }
            .padding(.vertical)
            
            HStack {
                Text(anime.description ?? "No description")
                    .font(.caption2)
            }
            Text("\(anime.url)")
        }
    }
}

struct AnimeDetail_Previews: PreviewProvider {
    static var previews: some View {
        AnimeDetail(anime:.testLong)
    }
}
