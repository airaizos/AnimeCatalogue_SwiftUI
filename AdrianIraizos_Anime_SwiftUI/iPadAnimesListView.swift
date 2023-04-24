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
    @State private var filteredAnimes:[Anime] = []
    
    @State var selectedAnime:Anime?
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            List(Obra.allCases, selection: $selectedObra) { obra in
                NavigationLink(obra.rawValue, value: obra)
            }
            .navigationTitle("Tipo")
        } content: {
            
            
            List(filteredAnimes,selection: $selectedAnime) { anime in
                
                NavigationLink(anime.title,value: anime)
                
            }
            .navigationTitle(selectedObra?.rawValue ?? "Lista")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    //MARK: TODO filtro no funciona
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
                    }
                }
            }
        } detail: {
            
            if let selected  = selectedAnime {
                AnimeDetailView(detailViewModel: AnimeDetailViewModel(anime: selected))
            }
        }
        .background(Color.offWhite)
      //  .navigationTitle("Animes")
        .searchable(text: $viewModel.search)
        /*
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
                }
            }
        }
        */
        .onChange(of: selectedObra) { obra in
            if let obra = obra {
                filteredAnimes = viewModel.getListFor(type: obra)
            } else {
                filteredAnimes = viewModel.anime
            }
        }
        .task(priority: .high) {
            await viewModel.getData()
        }
    }
}

struct iPadAnimesListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimesListView(navigationState: .constant(.home),namespace: Namespace().wrappedValue)
            .environmentObject(AnimesViewModel.animesPreview)
        
    }
}
