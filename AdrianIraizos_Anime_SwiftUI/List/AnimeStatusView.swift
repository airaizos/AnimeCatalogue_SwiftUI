//
//  FinalizadoView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct AnimeStatusView: View {
    let letter: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
            .fill(Color.offWhite)
            .padding(-5)
                .styled()
            Text(letter)
              
                .fontWeight(.bold)
        }
        .aspectRatio(3, contentMode: .fit)
        .padding(10)
    }
}


struct AnimeStatusView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeStatusView(letter: "P")
    }
}
