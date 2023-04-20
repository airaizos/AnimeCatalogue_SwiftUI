//
//  AnimesListView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI

struct AnimesListView: View {
    @EnvironmentObject var viewModel:AnimesViewModel
  //  @State var showWatched = false
    @Binding var navigationState: NavigationState
    let nameSpace:Namespace.ID
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.animesSearch) { anime in
                        NavigationLink(value: anime) {
                            AnimeListCell(anime: anime)
                                .padding(10)
                                .background(LightBackground(isHighlighted: true, shape: RoundedRectangle(cornerRadius: 10)))
                        }
                    }
                    .padding(10)
                }
                .navigationDestination(for: Anime.self) { value in
                    AnimeDetailView(detailViewModel: AnimeDetailViewModel(anime: value))
                }
            }
            .background(Color.offWhite)
            .navigationTitle("Animes")
            .searchable(text: $viewModel.search)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Picker(selection: $viewModel.obraPicker) {
                        Text("OVA").tag(1)
                        Text("Pelicula").tag(2)
                        Text("Especial").tag(3)
                        Text("Anime").tag(4)
                        Text("All").tag(0)
                    } label: {
                      
                    }
                    .pickerStyle(.inline)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        navigationState = .splash
                    } label: {
                        Image("buttonImage")
                            
                            .clipShape(Circle())
                            .matchedGeometryEffect(id: "splash", in: nameSpace)
                    }
                    .buttonStyle(FavoriteButtonStyle(color:.yellow))
                }
            }
      
           
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                    Menu("Sort") {
                        Picker(selection: $viewModel.sorted, label: Text("Options")) {
                            ForEach(SortedBy.allCases) { sorted in
                                Button {
                                    viewModel.sorted = sorted
                                } label: {
                                    Text(sorted.rawValue)
                                }
                            }
                        }
                    }
                }
            }
          
        }
        .task(priority: .high) {
            await viewModel.getData()
        }
        
    }
}

struct AnimesListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimesListView(navigationState: .constant(.home),nameSpace: Namespace().wrappedValue)
            .environmentObject(AnimesViewModel.animesPreview)
            
    }
}
