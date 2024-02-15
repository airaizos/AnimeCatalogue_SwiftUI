//
//  WelcomeLogoView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 21/9/23.
//

import SwiftUI

struct WelcomeLogoView: View {
    let image: String
    let namespace: Namespace.ID
    let spinning: Bool
    
    var body: some View {
        NeumorphicStrokeStyle(isHighlighted: false, shape: Circle(), image: Image(image))
        .matchedGeometryEffect(id: image, in: namespace)
        .scaleEffect(CGSize(width: spinning ? 0.1 : 1, height: spinning ? 0.1 : 1), anchor: .center)
    }
}

#Preview {
    WelcomeLogoView(image: "splash", namespace: Namespace().wrappedValue, spinning: true)
}
