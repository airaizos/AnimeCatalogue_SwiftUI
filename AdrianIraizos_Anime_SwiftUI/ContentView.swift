//
//  ContentView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI

struct ContentView: View {
    let persistence = ModelPersistence()
    @State var anime:Anime
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(anime.title)
            Text(anime.description)
        }
        .padding()
        .onAppear {
         
            if let primero = try? persistence.getAnimes().first {
                print(primero.description)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(anime: .test)
    }
}
