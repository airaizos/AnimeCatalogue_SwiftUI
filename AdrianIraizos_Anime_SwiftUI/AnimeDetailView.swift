//
//  detailViewModel.animeDetail.swift
//  AdrianIraizos_detailViewModel.anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct AnimeDetailView: View {
    @EnvironmentObject var viewModel:AnimesViewModel
    @ObservedObject var detailViewModel:AnimeDetailViewModel
    
    @State var shared = false
    var body: some View {
        ZStack {
            Color.offWhite
                .edgesIgnoringSafeArea(.top)
    
            VStack(spacing:10) {
                    Text(detailViewModel.upAndDownText(detailViewModel.anime.title))
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                Text(detailViewModel.anime.genres ?? "")
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
                            Text(detailViewModel.anime.followersFormatted)
                        }
                        Spacer()
                        VStack {
                            Text("year")
                                .modifier(detailLabel())
                            Text("\(detailViewModel.anime.yearFormatted)")
                             
                        }
                        Spacer()
                        VStack {
                            Text("episodes")
                                .modifier(detailLabel())
                            Text("\(detailViewModel.anime.episodes)")
                        }
                        Spacer()
                        VStack {
                            Text("status")
                                .modifier(detailLabel())
                            Text("\(detailViewModel.anime.status.rawValue)")
                            
                        }
                    }
                    .modifier(detailLabelInfo())
                    .padding(.horizontal)

                    HStack {
                        AsyncImageNeumorphicStyle(imageURL: detailViewModel.anime.image,width: 150 * 1.5,height: 210 * 1.5)
                    }
                    .padding(.bottom)
                    HStack(alignment:.top){
                        Spacer()
                        VStack {
                            
                            Text("rate")
                                .modifier(detailLabel())
                            
                            RatingView(rate: detailViewModel.anime.rateDouble)
                        }
                        Spacer()
                    
                        VStack {
                            Text("watched")
                                .modifier(detailLabel())
                            
                            WatchedShapeView(isHighlighted: detailViewModel.isFavorite(anime: detailViewModel.anime))
                        }
                        Spacer()
                        VStack {
                            Text("votes")
                                .modifier(detailLabel())
                            Text(detailViewModel.anime.votesString)
                                .modifier(detailLabelInfo())
                        }
                        Spacer()
                    }
                   
                    
                    VStack(alignment:.leading, spacing:5) {
                        Text("summary")
                            .font(.caption)
                            .bold()
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                        ScrollView{
                            Text(detailViewModel.anime.description ?? "No description")
                                .modifier(detailLabelInfo())
                                .textSelection(.enabled)
                        }
                    }
                  
                        VStack(alignment: .leading,spacing:5) {
                            Text("recommended for you")
                                .font(.caption)
                                .bold()
                                .foregroundColor(.secondary)
                                .padding(.horizontal)
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack(spacing:10) {
                                    
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
                    .padding(.horizontal)
                }
                .navigationTitle(detailViewModel.anime.type.rawValue)
                .navigationBarTitleDisplayMode(.inline)
                
                .toolbar {
                    ToolbarItem(placement:.navigationBarTrailing) {
                        Button {
                            detailViewModel.toggleWatched(anime: detailViewModel.anime)
                        } label: {
                            Image(systemName: "eye")
                                .foregroundColor(Color.gray)
                            
                        }
                        .buttonStyle(NeumorphicButtonStyle(isActive: true))
                    }
                    ToolbarItem(placement:.navigationBarTrailing) {
                       
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
                    ShareAnimeView(anime: detailViewModel.anime)
                }
            }
        }
}

struct AnimeDetail_Previews: PreviewProvider {
    static var previews: some View {
            NavigationStack {
                AnimeDetailView(detailViewModel:AnimeDetailViewModel(anime: .test))
                    .environmentObject(AnimesViewModel())
        }
    }
}
