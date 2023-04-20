//
//  FlipView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 20/4/23.
//

import SwiftUI

struct FlipView<Front: View, Back: View>: View {
    var isFlipped: Bool
    var front: () -> Front
    var back: () -> Back
    init(isFlipped: Bool = false, @ViewBuilder front: @escaping() -> Front, @ViewBuilder back: @escaping() -> Back) {
        self.isFlipped = isFlipped
        self.front = front
        self.back = back
    }
    var body: some View {
        ZStack {
            front()
                .rotation3DEffect(.degrees(isFlipped == true ? 1440 : 0), axis: (x:0, y:1, z:0))
                .opacity(isFlipped == true ? 0 : 1)
            back()
                .rotation3DEffect(.degrees(isFlipped == true ? 0 : -1440), axis: (x:0, y: 1, z:0))
                .opacity(isFlipped == true ? 1 : -1)
        }
    }
}
