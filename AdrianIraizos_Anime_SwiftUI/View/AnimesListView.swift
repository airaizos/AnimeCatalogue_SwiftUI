//
//  AnimesListView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI

struct AnimesListView: View {
    @EnvironmentObject var viewModel:AnimesViewModel
    @Binding var navigationState: NavigationState
    let namespace:Namespace.ID
    
    @State var selectedObra:Obra = .All
    
    var body: some View {
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
                AnimeDetailView(anime: value)
            }
        }
        .background(Color.offWhite)
        .navigationTitle("Animes")
        .searchable(text: $viewModel.search)
        .toolbar {
            obraPicker
            splashButton
            optionsButton
        }
        .task(priority: .high) {
            await viewModel.getData()
        }
    }
}

private extension AnimesListView {
    var optionsButton: some ToolbarContent {
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
                Image(systemName: "arrow.up.arrow.down")
                    .tint(Color.white)
                Text("\(viewModel.sorted.rawValue) \(viewModel.sortedAscending ? "↑" : "↓")")
                    .modifier(detailLabel())
            }
        }
    }
    
    var obraPicker: some ToolbarContent {
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
            .background(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.offWhite, lineWidth: 1))
        }
    }
    
    var splashButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                navigationState = .splash
            } label: {
                Image("buttonImage")
                
                    .clipShape(Circle())
                    .matchedGeometryEffect(id: "splash", in: namespace)
            }
        }
    }
    
}



struct AnimesListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimesListView(navigationState: .constant(.home),namespace: Namespace().wrappedValue)
            .environmentObject(AnimesViewModel.animesPreview)
        
    }
}


