//
//  WelcomeText.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 21/9/23.
//

import SwiftUI

struct WelcomeText: View {
    let step: Int
    let totalSteps: Int
    @Binding var spinning: Bool
    
    var body: some View {
        Text("Welcome to Anime Library")
            .foregroundStyle(Color.offWhite)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .shadow(radius: 3, x:5, y:5)
            .modifier(OpenAnimation(launch: $spinning, step: step, totalSteps: totalSteps))
    }
}

#Preview {
    WelcomeText(step: 1, totalSteps: 7, spinning: .constant(true))
}
