//
//  AdrianIraizos_Anime_SwiftUIApp.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI

@main
struct AdrianIraizos_Anime_SwiftUIApp: App {
    @Environment(\.userDevice) var device
    
    @StateObject var viewModel = AnimesViewModel()
    @State var navigationState: NavigationState = .splash
    var body: some Scene {
        WindowGroup {
           InitialView(navigationState: $navigationState)
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
