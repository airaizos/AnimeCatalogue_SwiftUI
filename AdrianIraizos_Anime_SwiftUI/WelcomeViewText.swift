//
//  WelcomeViewText.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 21/9/23.
//

import SwiftUI

struct WelcomeViewText: View {
    let firstStep: Int
    let totalSteps: Int
    @Binding var spinning: Bool
    
    let phrases = ["Discover animes",
                   "Mark all that you already watched",
                   "Share an anime with your friends",
                   "Search for new animes",
                   "See ratings, followers and votes"]
    
    var body: some View {

        ForEach(phrases.indices, id: \.self) { index in
            Text(phrases[index])
                .modifier(OpenAnimation(launch: $spinning, step: firstStep + index, totalSteps: totalSteps))
                .foregroundColor(.b471337.opacity(0.7))
                .font(.headline)
        }
    }
}

#Preview {
    WelcomeViewText(firstStep: 2, totalSteps: 7, spinning: .constant(true))
}
