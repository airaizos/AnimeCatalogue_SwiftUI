//
//  WatchedColumnView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 19/4/23.
//

import SwiftUI

struct WatchedColumnView: View {
    var animes:[Anime]
    let gridFlexible:[GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    var color:Color
    var title:String
    var subtitle:String = ""
    var body: some View {
        NavigationStack {
            VStack {
                Text(title)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black.opacity(0.8))
                Text(subtitle)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                ScrollView(.vertical,showsIndicators: false) {
                    ZStack{
                        GridBackground(color: color)
                        LazyVStack(spacing:0){
                            ForEach(animes){ ova in
                                NavigationLink(value: ova) {
                                    
                                    AnimeGridCellView(anime: ova,titleColor: .white)
                                }
                            }
                            
                            .padding(.vertical)
                            
                        }
                    }
                }
            }
            .navigationDestination(for: Anime.self) { value in
                AnimeDetailView(detailViewModel: AnimeDetailViewModel(anime: value))
            }
            
        }
    }
}

struct WatchedColumnView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            WatchedColumnView(animes: [.test,.testLong,.testShort], color:.purple,title:"OVA")
        }
    }
}