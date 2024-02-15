//
//  AnimeTypeView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct AnimeTypeView: View {
    let letter: String
    let color: Color
    var size:InfoSize = .large
    var body: some View {
        ZStack(alignment:.bottom){
            Text(letter)
                .font(size.fontSize)
                .fontWeight(.bold)
                .background {
                    Polygon(sides: 5)           .stroke(style: StrokeStyle(lineWidth: size.rawValue * 1.5, lineCap: .round, lineJoin: .round))
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [color, color.opacity(0.5)]),
                            center:.center,
                            startRadius: 0,
                            endRadius: 20
                            ))
                        .opacity(0.6)
                        .frame(width: 15 * size.rawValue)
                        .rotationEffect(Angle(degrees: -17))
                }
        }
        .padding(10)
    }
}

extension AnimeTypeView {
    init(iconLabel: IconLabel) {
        letter = iconLabel.name
        color = iconLabel.color
    }
}

struct AnimeTypeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeTypeView(letter: "A",color: .orange)
    }
}
