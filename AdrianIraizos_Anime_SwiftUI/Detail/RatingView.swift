//
//  RatingView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct RatingView: View {
    let rate:Double
    var body: some View {
        ZStack {
            Text(String(format: "%.1f",rate))
                .font(.body)
                .bold()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color.offWhite)
                    )
                .styled()
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rate: 4.7)
    }
}


struct NeumorphicStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .gray, radius: 15, x: 10, y: 10)
            .shadow(color: .white, radius: 15, x: -10, y: -10)
    }
}

extension View {
    func styled() -> some View {
        modifier(NeumorphicStyle())
    }
}
