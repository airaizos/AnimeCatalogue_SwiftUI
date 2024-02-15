//
//  FinalizadoView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct AnimeStatusView: View {
    let letter: String
    let color: Color
    let size: InfoSize = .large
    
    var body: some View {
        ZStack(alignment:.bottom){
            Text(letter)
                .font(size.fontSize)
                .fontWeight(.bold)
                .background {
                    Triangle()
                        .stroke(style: StrokeStyle(lineWidth: size.rawValue * 1.5, lineCap: .round, lineJoin: .round))
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [color, color.opacity(0.5)]),
                            center:.center,
                            startRadius: 0,
                            endRadius: 20
                        ))
                        .opacity(0.6)
                        .frame(width: 15 * size.rawValue,height: 15 * size.rawValue)
                        .offset(y:-2 * size.rawValue)
                }
        }
        .padding(10)
    }
}

extension AnimeStatusView {
    init(statusIcon: IconLabel) {
        letter = statusIcon.name
        color = statusIcon.color
    }
}

struct AnimeStatusView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeStatusView(letter: "P",color:.blue)
    }
}
