//
//  WatchedGridView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 21/4/23.
//

import SwiftUI

struct WatchedGridView: View {
    @EnvironmentObject var viewModel:AnimesViewModel
    @ObservedObject var grid = ModeloColumnas()
    var body: some View {
        ZStack{
            Color.offWhite
                .ignoresSafeArea()
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: grid.gridItem) {
                        ForEach(viewModel.watchedAnimes) { anime in
                            NavigationLink(value: anime) {
                                AnimeGridCellView(anime: anime,titleColor: .gray,infoSize: grid.size)
                            }
                        }
                    }
                    .navigationDestination(for: Anime.self, destination: { value in
                        AnimeDetailView(detailViewModel: AnimeDetailViewModel(anime: value))
                    })
                    .padding(.vertical)
                }
                .navigationTitle("Watched")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                       
                        Menu{
                            ForEach(1..<5) { num in
                                Button("\(num)") {
                                    grid.setGridNum(num)
                                }
                            }
                        } label: {
                            Image(systemName: "lane")
                        }
                        
                    }
                }
            }
  
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WatchedGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WatchedGridView(grid: ModeloColumnas())
                .environmentObject(AnimesViewModel(persistence: PersistenceTest(fileLocation: FilePreview())))
            
        }
    }
}


