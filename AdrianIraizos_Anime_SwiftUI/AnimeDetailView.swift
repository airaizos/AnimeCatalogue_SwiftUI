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
                    VStack {
                        HStack(alignment:.top)  {
                            
                            VStack {
                                Text("rate")
                                    .foregroundColor(.gray)
                                RatingView(rate: detailViewModel.anime.rateDouble)
                                
                            }
                          
                            VStack {
                                Text("type")
                                    .foregroundColor(.gray)
                             
                                AnimeTypeView(type: detailViewModel.anime.typeLetter,size:.small)
                                Text(detailViewModel.anime.type.rawValue)
                                    .foregroundColor(.black.opacity(0.7))
                                    .font(.caption2)
                            }
                            VStack {
                                   Text("status")
                                    .foregroundColor(.gray)
                                AnimeStatusView(status: detailViewModel.anime.statusLetter,size: .small)
                                Text(detailViewModel.anime.status.rawValue)
                                    .foregroundColor(.black.opacity(0.7))
                                    .font(.caption2)
                            }
                        }
                      
                        
                        HStack(alignment:.top) {
                            VStack {
                                Text("followers")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                                Text(detailViewModel.anime.followersFormatted)
                            }
                            VStack {
                                Text("votes")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                                Text("\(detailViewModel.anime.votes ?? 0)")
                            }
                            VStack {
                                Text("year")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                                Text("\(detailViewModel.anime.yearFormatted)")
                                    .foregroundColor(.black.opacity(0.7))
                                    .font(.callout)
                            }
                            
                        }
                        HStack(alignment:.top) {
                            VStack {
                                Text("episodes")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                                Text("\(detailViewModel.anime.episodes)")
                                    .bold()
                                
                            }
                            VStack {
                                Text("watched")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                                ZStack {
                                    Polygon(sides:6)
                                    
                                        .foregroundColor(.green)
                                        .frame(width: 30)
                                    Image(systemName: "eye.circle")
                                
                                }
                           
                            }
                            VStack {
                                Text("Favorite")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                                Points(points: 5, size: 6, distance: 9)
                                    .foregroundColor(.yellow)
                              
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
