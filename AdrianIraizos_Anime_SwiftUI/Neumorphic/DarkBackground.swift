//
//  DarkBackground.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI

struct DarkBackground<S:Shape>:View {
    var isHighlighted:Bool
    var shape:S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(colors: [Color.darkEnd,Color.darkStart], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(colors: [Color.darkStart,Color.darkEnd], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
        .animation(nil, value:0)
    }
}
