//
//  FavoriteShapeView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 17/4/23.
//

import SwiftUI

struct FavoriteShapeView: View {
    var isHighlighted:Bool
    
    var body: some View {
        Image(systemName: isHighlighted ? "star" : "star.slash")
            .symbolVariant(.slash)
             .font(.subheadline)
             .foregroundColor(.gray)
             .contentShape(Star(points: 5,innerRadio: 2))
             .background(
                NeumorphicViewStyle(isHighlighted: isHighlighted, shape: Star(points: 5,innerRadio: 2))
                    .rotationEffect(Angle(degrees: -55))
               )
             .padding(5)
    }
}

struct FavoriteShapeView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteShapeView(isHighlighted: true)
    }
}
