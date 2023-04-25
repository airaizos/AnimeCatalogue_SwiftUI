//
//  detailViewModel.animeDetail.swift
//  AdrianIraizos_detailViewModel.anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct AnimeDetailView: View {
    @EnvironmentObject var viewModel:AnimesViewModel
  //  @ObservedObject var detailViewModel:AnimeDetailViewModel
    let anime:Anime
    
    @State var shared = false
    var body: some View {
        ZStack {
            Color.offWhite
                .edgesIgnoringSafeArea(.top)
    
            VStack {
                    Text(viewModel.upAndDownText(anime.title))
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                Text(anime.genres ?? "")
                    .font(.caption2)
                    .foregroundColor(.cyan)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding(.horizontal)
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
                    .padding(.horizontal)

                    HStack {
                        AsyncImageNeumorphicStyle(imageURL: anime.image,width: 150 * 1.5,height: 210 * 1.5)
                    }
                    .padding(.bottom)
                    HStack(alignment:.top){
                        Spacer()
                        VStack {
                            
                            Text("rate")
                                .modifier(detailLabel())
                            
                            RatingView(rate: anime.rateDouble)
                        }
                        Spacer()
                    
                        VStack {
                            Text("watched")
                                .modifier(detailLabel())
                            
                            WatchedShapeView(isHighlighted: viewModel.isWatched(anime: anime))
                        }
                        Spacer()
                        VStack {
                            Text("votes")
                                .modifier(detailLabel())
                            Text(anime.votesString)
                                .modifier(detailLabelInfo())
                        }
                        Spacer()
                    }

                    VStack(alignment:.leading, spacing:5) {
                        Text("summary")
                            .modifier(detailLabel())
                            .padding(.horizontal)
                        ScrollView{
                            Text(anime.description ?? "No description")
                                .modifier(detailLabelInfo())
                                .textSelection(.enabled)
                                .multilineTextAlignment(.center)
                        }
                    }
                  Divider()
                        VStack(alignment: .leading,spacing:5) {
                            Text("recommended for you")
                                .modifier(detailLabel())
                                .padding(.horizontal)
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack(spacing:15) {
                                    
                                    ForEach(viewModel.recommendedAnimes) { recommendend in
                                        VStack {
                                            GeometryReader { geo in
                                                NavigationLink(value: recommendend) {
                                                    RecommendedAnime(anime: recommendend)
                                                        .rotation3DEffect(.degrees(Double(geo.frame(in: .global).minX) / 8), axis: (x:0, y:1, z:0))
                                                        .frame(width:210, height: 90)
                                                }
                                            }
                                            .frame(width: 200,height:90)
                                        }
                                    }
                                }
                            }
                        }
                    }
                .padding([.vertical,.horizontal])
                }
                .navigationTitle(anime.type.rawValue)
                .navigationBarTitleDisplayMode(.inline)
                
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button {
                                viewModel.toggleWatched(anime: anime)
                            } label: {
                                Image(systemName: "eye")
                                    .foregroundColor(Color.gray)
                            }
                            .buttonStyle(NeumorphicButtonStyle(isActive: true))
                            Button {
                                shared.toggle()
                            } label: {
                                Image(systemName: "square.and.arrow.up.fill")
                                    .foregroundColor(Color.gray)
                            }
                            .buttonStyle(NeumorphicButtonStyle(isActive: true))
                    }
                }
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
