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
                HStack {
                    ZStack{
                   
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.offWhite)
                            .shadow(color:Color.black.opacity(0.2), radius: 10, x:10, y:10)
                            .shadow(color:Color.white.opacity(0.7), radius: 10, x:5, y:5)
                            .frame(width:155, height: 220)
                        AsyncImage(url: detailViewModel.anime.image) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(30)
                                .frame(width:150, height: 250)
                        } placeholder: {
                            Image(systemName: "popcorn")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(30)
                        }
                    }
                    Grid(verticalSpacing:30) {
                        GridRow(alignment:.top)  {
                            
                            VStack {
                                Text("rate")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                                
                                RatingView(rate: detailViewModel.anime.rateDouble)
                                
                            }
                          
                            VStack {
                                Text("type")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                             
                                AnimeTypeView(type: detailViewModel.anime.typeLetter,size:.small)
                                Text(detailViewModel.anime.type.rawValue)
                                    .foregroundColor(.black.opacity(0.7))
                                    .font(.caption2)
                            }
                            VStack {
                                   Text("status")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                                AnimeStatusView(status: detailViewModel.anime.statusLetter,size: .small)
                                Text(detailViewModel.anime.status.rawValue)
                                    .foregroundColor(.black.opacity(0.7))
                                    .font(.caption2)
                                    .bold()
                            }
                        }
                        GridRow(alignment:.top) {
                            VStack {
                                Text("followers")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                                Text(detailViewModel.anime.followersFormatted)
                                    .font(.callout)
                                    .bold()
                            }
                            VStack {
                                Text("votes")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                                Text("\(detailViewModel.anime.votes ?? 0)")
                                    .font(.callout)
                                    .bold()
                                
                            }
                            VStack {
                                Text("year")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                                Text("\(detailViewModel.anime.yearFormatted)")
                                    .foregroundColor(.black.opacity(0.7))
                                    .font(.callout)
                                    .bold()
                            }
                            
                        }
                        GridRow(alignment:.top) {
                            VStack {
                                Text("episodes")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                                    .padding(.bottom,3)
                                Text("\(detailViewModel.anime.episodes)")
                                    .bold()
                                
                            }
                            VStack {
                                Text("watched")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                               
                                WatchedShapeView(isHighlighted: detailViewModel.isFavorite(anime: detailViewModel.anime))
                            
                           
                            }
                            VStack {
                                Text("Favorite")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                            
                                FavoriteShapeView(isHighlighted: detailViewModel.isFavorite(anime: detailViewModel.anime))
                              
                            }
                        }
                    }
                }
                
                .padding([.horizontal,.vertical])
                
                
                
                HStack {
                    ScrollView{
                        Text(detailViewModel.anime.description ?? "No description")
                            .font(.caption2)
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
