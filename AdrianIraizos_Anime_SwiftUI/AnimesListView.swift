//
//  AnimesListView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI

struct AnimesListView: View {
    @EnvironmentObject var viewModel: AnimesViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.animes, id:\.self) { anime in
                        NavigationLink(value: anime) {
                            AnimeListCell(anime: anime)
                                .padding(10)
                                .background(LightBackground(isHighlighted: true, shape: RoundedRectangle(cornerRadius: 10)))
                        }
                        .padding(10)
                    }
                }
            }
            .background(Color.black)
        }
        
    }
}

struct AnimesListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimesListView()
            .environmentObject(AnimesViewModel.animesPreview)
    }
}
