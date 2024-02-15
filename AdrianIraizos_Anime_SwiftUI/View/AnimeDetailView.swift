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
                        LabelIcon(title: "followers", subtitle: anime.followersFormatted)
                        Spacer()
                        LabelIcon(title: "year", subtitle: anime.yearFormatted)
                        Spacer()
                        LabelIcon(title: "episodes", subtitle: "\(anime.episodes)")
                        Spacer()
                        LabelIcon(title: "status", subtitle: anime.status.rawValue)
                    }
                    HStack {
                        AsyncImageNeumorphicStyle(imageURL: anime.image,width: 150 * 1.5,height: 210 * 1.5)
                    }
                    .padding(.bottom)
                    
                    HStack(alignment:.firstTextBaseline){
                        
                        LabelIcon(title: "rate", subtitle: "\(anime.rateDouble)")
                       
                        Spacer()
                        LabelIcon(title: "votes", subtitle: anime.votesString)
                        Spacer()
                        VStack {
                            Text("watched")
                                .modifier(detailLabel())
                            Button {
                                viewModel.toggleWatched(anime: anime)
                            } label: {
                                Image(systemName: viewModel.isWatched(anime: anime) ? "checkmark" : "eye.slash")
                            }
                            .buttonStyle(NeumorphicButtonStyle(isActive: true))
                        }
                    }
                    
                    VStack(alignment:.leading, spacing:10) {
                        Text("summary")
                            .modifier(detailLabel())
                            .padding(.horizontal)
                            Text(anime.description ?? "No description")
                                .modifier(sumaryLabelInfo())
                                .textSelection(.enabled)
                                .multilineTextAlignment(.leading)
                    }
                    .padding(.top)
                    Divider()
                    RecommendedAnimesList(animes: viewModel.recommendedAnimes)
                        .onChange(of: viewModel.watched) { value in
                            try?  viewModel.persistence.saveWatchedAnimes(value)
                        }
                }
                .padding([.vertical,.horizontal])
            }
            .navigationTitle(anime.type.rawValue)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                shareButton
            }
            .sheet(isPresented: $shared) {
                ShareAnimeView(anime: anime)
            }
        }
    }
}

extension AnimeDetailView {
    var shareButton: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button {
                shared.toggle()
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            .buttonStyle(NeumorphicButtonStyle(isActive: true))
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


struct LabelIcon: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack {
            Text(title)
                .modifier(detailLabel())
            Text(subtitle)
                .modifier(detailLabelInfo())
        }
    }
}


