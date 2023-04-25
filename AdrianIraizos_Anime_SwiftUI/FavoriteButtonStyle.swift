//
//  FavoriteButtonStyle.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

enum Intensity {
    case low, medium, high
}

struct FavoriteButtonStyle:ButtonStyle {
    var color: Color = Color.yellow
    var strokeColor:Color = Color.white

    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body)
            .fontWeight(.heavy)
            .foregroundColor(strokeColor)
            .background(
                RadialGradient(
                    gradient: Gradient(colors: [color, color.opacity(0)]),
                    center:.center,
                    startRadius: 0,
                    endRadius: 10
                    )
            )
           
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
