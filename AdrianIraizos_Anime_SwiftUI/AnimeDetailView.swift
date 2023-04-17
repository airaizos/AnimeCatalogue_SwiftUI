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
                .ignoresSafeArea()
            VStack {
                Text(detailViewModel.upAndDownText(detailViewModel.anime.title))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                HStack{
                    AsyncImage(url: detailViewModel.anime.image) { image in
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
                        HStack(alignment:.top)  {
                            VStack {
                                Text("year")
                                Text("\(detailViewModel.anime.yearFormatted)")
                                
                            }
                            VStack {
                                Text("type")
                                Text(detailViewModel.anime.type.rawValue)
                                AnimeTypeView(type: detailViewModel.anime.typeLetter)
                            }
                            VStack {
                                //    Text("status")
                                
                                AnimeStatusView(status: detailViewModel.anime.statusLetter,size: .medium)
                                Text(detailViewModel.anime.status.rawValue)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical)
                        HStack(alignment:.top) {
                            VStack {
                                Text("episodes")
                                Text("\(detailViewModel.anime.episodes)")
                                
                            }
                            VStack {
                                Text("watched")
                                ZStack{
                                    Polygon(sides:6)
                                    
                                        .foregroundColor(.green)
                                        .frame(width: 30)
                                    Image(systemName: "eye.circle")
                                }
                            }
                            VStack {
                                Text("Favorite")
                                Points(points: 5, size: 6, distance: 9)
                                    .foregroundColor(.yellow)
                            }
                        }
                        HStack(alignment:.top) {
                            VStack {
                                Text("Followers")
                                    .fontWidth(.condensed)
                                Text(detailViewModel.anime.followersFormatted)
                            }
                            VStack {
                                Text("Votes")
                                Text("\(detailViewModel.anime.votes ?? 0)")
                            }
                            VStack {
                                Text("Rate")
                                RatingView(rate: detailViewModel.anime.rateDouble)
                                
                            }
                            
                        }
                        
                    }
                }
                .padding([.horizontal,.vertical])
                
                HStack {
                    ScrollView{
                        Text(detailViewModel.anime.description ?? "No description")
                            .font(.caption2)
                            .fontDesign(.serif)
                            .textSelection(.enabled)
                    }
                    .frame(maxHeight:100)
                }
                .padding()
                Link("More Info",destination: detailViewModel.anime.url)
                    .tint(.indigo)
                
                
            }
            .navigationTitle(detailViewModel.anime.type.rawValue)
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItemGroup(placement:.bottomBar) {
                    Button {
                        detailViewModel.toggleWatched(anime: detailViewModel.anime)
                    } label: {
                        Image(systemName: "eye")
                            .foregroundColor(Color.gray)
                        
                    }
                    .buttonStyle(NeumorphicButtonStyle(isActive: detailViewModel.isWatched(anime:detailViewModel.anime)))
                    Button {
                        detailViewModel.toggleFavorite(anime:detailViewModel.anime)
                    } label: {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.gray)
                    }
                  
                    .buttonStyle(NeumorphicButtonStyle(isActive: detailViewModel.isFavorite(anime: detailViewModel.anime)))
                   
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
