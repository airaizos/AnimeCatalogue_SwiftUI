//
//  GridBackground.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 20/4/23.
//

import SwiftUI

struct GridBackground: View {
    var color:Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(color.opacity(0.3))
        
                .shadow(color: Color.white.opacity(0.9), radius: 10, x: -10, y: -10)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 10, y: 10)
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(color.opacity(0.4))
            
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(color.opacity(0.2))
                        .shadow(color: Color.white.opacity(0.9), radius: 10, x: -5, y: -5)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
                )
        }
    }
}
