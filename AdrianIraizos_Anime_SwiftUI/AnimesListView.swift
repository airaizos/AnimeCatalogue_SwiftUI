//
//  AnimesListView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI

struct AnimesListView: View {
    @EnvironmentObject var viewModel: AnimesViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AnimesListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimesListView()
            .environmentObject(AnimesViewModel.animesPreview)
    }
}
