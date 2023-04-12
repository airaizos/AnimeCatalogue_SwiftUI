//
//  AnimeTypeView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct AnimeTypeView: View {
    let type:(letra:String,color:Color)
    var size:infoSize = .small
    var body: some View {
        ZStack(alignment:.bottom){
            Text(type.letra)
                .font(size.fontSize)
                .fontWeight(.bold)
                .background {
                    Polygon(sides: 5)           .stroke(style: StrokeStyle(lineWidth: size.rawValue * 2, lineCap: .round, lineJoin: .round))
                        .fill(type.color)
                        .opacity(0.6)
                        .frame(width: 15 * size.rawValue)
                        .rotationEffect(Angle(degrees: -17))
                }
        }
    }
    
}

struct AnimeTypeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeTypeView(type: ("A",.orange))
    }
}
