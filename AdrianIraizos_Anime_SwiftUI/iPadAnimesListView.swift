//
//  iPadAnimesListView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI


struct iPadAnimesListView: View {
    @EnvironmentObject var viewModel:AnimesViewModel
    @Binding var navigationState: NavigationState
    let namespace:Namespace.ID
    
    @State var visibility: NavigationSplitViewVisibility = .all
    @State var selectedObra:Obra?
    @State var selectedAnime:Anime?
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            List(Obra.allCases, selection: $selectedObra) { obra in
                NavigationLink(obra.rawValue, value: obra)
            }
            .onChange(of: selectedObra) { obra in
                viewModel.obraFilter = obra ?? .Anime
            }
            .navigationTitle("Tipo")
        } content: {
            List(viewModel.animesSearch,selection: $selectedAnime) { anime in
                
                NavigationLink(anime.title,value: anime)
                
            }
            .navigationTitle(selectedObra?.rawValue ?? "Lista")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
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
                        Image(systemName: "arrow.up.arrow.down")
                            .tint(Color.gray)
                        Text("\(viewModel.sorted.rawValue) \(viewModel.sortedAscending ? "↑" : "↓")")
                            .modifier(detailLabel())
                    }
                }
            }
        } detail: {
            if let selected  = selectedAnime {
                AnimeDetailView(anime: selected)
            }
        }
        .task(priority: .high) {
            await viewModel.getData()
        }
        .background(Color.offWhite)
        .searchable(text: $viewModel.search)
    }
     
}

struct iPadAnimesListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimesListView(navigationState: .constant(.home),namespace: Namespace().wrappedValue)
            .environmentObject(AnimesViewModel.animesPreview)
        
    }
}
