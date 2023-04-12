//
//  AdrianIraizos_Anime_SwiftUIApp.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI

@main
struct AdrianIraizos_Anime_SwiftUIApp: App {
    @StateObject var viewModel = AnimesViewModel()
    
    var body: some Scene {
        WindowGroup {
            AnimesListView()
                .environmentObject(viewModel)
                .overlay {
                    if viewModel.loading {
                        LoadingView()
                            .transition(.opacity)
                    }
                }
                .animation(.default, value: viewModel.loading)
        }
    }
}
