//
//  detailViewModel.animeDetail.swift
//  AdrianIraizos_detailViewModel.anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct AnimeDetailView: View {
    @EnvironmentObject var viewModel:AnimesViewModel
    
    let anime:Anime
    
    @State var shared = false
    var body: some View {
        ZStack {
            Color.offWhite
                .ignoresSafeArea()
            VStack {
                Text(anime.title)
                    .modifier(titleLabelInfo())
                
                Text(anime.genreView)
                    .modifier(subtitleLabelInfo())
                
                ScrollView(showsIndicators:false) {
                    
                    HStack(alignment:.top) {
                        VStack {
                            Text("followers")
                                .modifier(detailLabel())
                            Text(anime.followersFormatted)
                        }
                        Spacer()
                        VStack {
                            Text("year")
                                .modifier(detailLabel())
                            Text("\(anime.yearFormatted)")
                            
                        }
                        Spacer()
                        VStack {
                            Text("episodes")
                                .modifier(detailLabel())
                            Text("\(anime.episodes)")
                        }
                        Spacer()
                        VStack {
                            Text("status")
                                .modifier(detailLabel())
                            Text("\(anime.status.rawValue)")
                            
                        }
                    }
                    .modifier(detailLabelInfo())
                    
                    HStack {
                        AsyncImageNeumorphicStyle(imageURL: anime.image,width: 150 * 1.5,height: 210 * 1.5)
                    }
                    .padding(.bottom)
                    
                    //
                    HStack(alignment:.firstTextBaseline){
                     
                        VStack {
                            Text("rate")
                                .modifier(detailLabel())
                            RatingView(rate: anime.rateDouble)
                        }
                      Spacer()
                        VStack {
                            Text("watched")
                                .modifier(detailLabel())
                            Button {
                                viewModel.toggleWatched(anime: anime)
                            } label: {
                                WatchedShapeView(isHighlighted: viewModel.isWatched(anime: anime),isOn: "checkmark", isOff: "eye.slash",shape: Polygon(sides: 6))
                            }
                            .buttonStyle(NeumorphicButtonStyle(isActive: true))
                        }
                      Spacer()
                        VStack {
                            Text("votes")
                                .modifier(detailLabel())
                            
                            Text(anime.votesString)
                                .modifier(detailLabelInfo())
                                .padding(.top)
                        }
                      Spacer()
                        VStack {
                            Text("shared")
                                .modifier(detailLabel())
                            Button {
                                shared.toggle()
                            } label: {
                                WatchedShapeView(isHighlighted: true,isOn: "square.and.arrow.up.fill", isOff: "square.and.arrow.up.fill",shape: Polygon(sides: 10))
                                
                            }
                            
                            .buttonStyle(NeumorphicButtonStyle(isActive: true))
                        }
                    
                    }
                    
                    VStack(alignment:.leading, spacing:10) {
                        Text("summary")
                            .modifier(detailLabel())
                            .padding(.horizontal)
                        ScrollView{
                            Text(anime.description ?? "No description")
                                .modifier(sumaryLabelInfo())
                                .textSelection(.enabled)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding(.top)
                    Divider()
                    VStack(alignment: .leading,spacing:5) {
                        Text("recommended for you")
                            .modifier(detailLabel())
                            .padding(.horizontal)
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack(spacing:15) {
                                
                                ForEach(viewModel.recommendedAnimes) { recommendend in
                                    
                                    NavigationLink(value: recommendend) {
                                        RecommendedAnime(anime: recommendend)
                                            .padding(.vertical,30)
                                    }
                                    
                                }
                            }
                        }
                    }
                    .onChange(of: viewModel.watched) { value in
                        try?  viewModel.persistence.saveWatchedAnimes(value)
                    }
                }
                .padding([.vertical,.horizontal])
            }
            .navigationTitle(anime.type.rawValue)
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $shared) {
                ShareAnimeView(anime: anime)
            }
        }
    }
}

struct AnimeDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AnimeDetailView(anime: .test)
                .environmentObject(AnimesViewModel())
        }
    }
}
