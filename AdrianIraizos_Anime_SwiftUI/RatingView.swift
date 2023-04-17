//
//  RatingView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct RatingView: View {
    var rate:Double
    var body: some View {
        ZStack {
            Text(String(format: "%.1f",rate))
                .font(.caption2)
                .bold()
                .background {
                    Star(points:Int(rate), innerRadio: 3)
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [.yellow, .yellow.opacity(0.5)]),
                            center:.center,
                            startRadius: 0,
                            endRadius: 20
                            ))
                        .opacity(0.6)
                        .frame(width: 15)
                }
        }
        .padding(9)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rate: 4.7)
    }
}
