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
                                .foregroundColor(.gray)
                                .font(.caption2)
                                .padding(.bottom,3)
                            Text(detailViewModel.anime.followersFormatted)
                                .font(.callout)
                                .bold()
                        }
                        Spacer()
                        VStack {
                            Text("year")
                                .foregroundColor(.gray)
                                .font(.caption2)
                                .padding(.bottom,3)
                            Text("\(detailViewModel.anime.yearFormatted)")
                           
                                .font(.callout)
                                .bold()
                        }
                        Spacer()
                        VStack {
                            Text("episodes")
                                .foregroundColor(.gray)
                                .font(.caption2)
                                .padding(.bottom,3)
                            Text("\(detailViewModel.anime.episodes)")
                                .bold()
                        }
                        Spacer()
                        VStack {
                            Text("status")
                                .foregroundColor(.gray)
                                .font(.caption2)
                                .padding(.bottom,3)
                            Text("\(detailViewModel.anime.status.rawValue)")
                                .font(.callout)
                                .bold()
                             
                        }
                    }
                    .padding(.horizontal)
                
                 
                    HStack {
                        AsyncImageNeumorphicStyle(imageURL: detailViewModel.anime.image,width: 150 * 1.5,height: 210 * 1.5)
                     
                        
                    }
                    .padding(.bottom)
                    HStack(alignment:.top){
                        Spacer()
                        VStack {
                            
                            Text("rate")
                                .foregroundColor(.gray)
                                .font(.caption2)
                            
                            RatingView(rate: detailViewModel.anime.rateDouble)
                            Text("\(detailViewModel.anime.votes ?? 0)")
                                .foregroundColor(.black.opacity(0.7))
                                .font(.caption2)
                        }
                        Spacer()
                    
                        VStack {
                            Text("watched")
                                .foregroundColor(.gray)
                                .font(.caption2)
                            
                            WatchedShapeView(isHighlighted: detailViewModel.isFavorite(anime: detailViewModel.anime))
                        }
                        Spacer()
                        VStack {
                            Text("favorite")
                                .foregroundColor(.gray)
                                .font(.caption2)
                            
                            FavoriteShapeView(isHighlighted: detailViewModel.isFavorite(anime: detailViewModel.anime))
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
                                .font(.caption2)
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
                        /*
                        Button {
                            detailViewModel.toggleFavorite(anime:detailViewModel.anime)
                            
                        } label: {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.gray)
                        }
                        
                        .buttonStyle(NeumorphicButtonStyle(isActive: detailViewModel.isFavorite(anime: detailViewModel.anime)))
                        */
                    }
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
