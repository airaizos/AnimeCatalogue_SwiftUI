//
//  LightBackground.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI

struct LightBackground<S:Shape>:View {
    var isHighlighted:Bool
    var shape:S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.offWhite)
                    .overlay (
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth:4)
                            .blur(radius: 4)
                            .offset(x:2, y:2)
                            .mask(shape
                                .fill(LinearGradient(colors: [Color.black, Color.clear], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .cornerRadius(20))
                        
                    )
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
