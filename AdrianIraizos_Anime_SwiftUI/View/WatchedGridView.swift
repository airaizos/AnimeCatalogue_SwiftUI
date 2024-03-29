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
            Color.gray
                .ignoresSafeArea()
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: grid.gridItem) {
                        ForEach(viewModel.watched) { anime in
                            NavigationLink(value: anime) {
                                AnimeGridCellView(anime: anime,infoSize: grid.size)
                                    .frame(alignment: .top)
                            }
                        }
                    }
                    .navigationDestination(for: Anime.self, destination: { value in
                        AnimeDetailView(anime: value)
                    })
                    .padding(.vertical)
                }
                .navigationTitle("Watched")
                .toolbar{
                    gridColumns
                    sortButton
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


extension WatchedGridView {
    var gridColumns: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Menu{
                ForEach(1..<5) { num in
                    Button("\(num)") {
                        grid.setGridNum(num)
                    }
                }
            } label: {
                Image(systemName: "lane")
                    .tint(Color.black)
            }
        }
    }
    
    var sortButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            
            Menu  {
                Picker(selection: $viewModel.sorted, label: Text("Options")) {
                    ForEach(SortedBy.allCases) { sorted in
                        Button {
                            viewModel.sorted = sorted
                        } label: {
                            Text(sorted.rawValue)
                        }
                    }
                }
            } label: {
                
                Text("\(viewModel.sorted.rawValue) \(viewModel.sortedAscending ? "↑" : "↓")")
                    .foregroundColor(.black)
                    .modifier(detailLabel())
            }
        }
    }
    
    
}

struct WatchedGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WatchedGridView(grid: ModeloColumnas())
                .environmentObject(AnimesViewModel(persistence: ModelPersistence(fileLocation: FilePreview())))
        }
    }
}


