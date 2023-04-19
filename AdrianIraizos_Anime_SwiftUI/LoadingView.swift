//
//  LoadingView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 12/4/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
           Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
            VStack {
                ProgressView()
                    .progressViewStyle(.circular)
                
                Text("Cargando tus animes")
                    .font(.headline)
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
