//
//  AnimeStatusLabel.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 12/4/23.
//

import SwiftUI

struct AnimeStatusLabel: View {
    var status:(letra:String,color:Color)
    var body: some View {
        Label {
            Text("Próximamente")
                .foregroundColor(.primary)
                .font(.largeTitle)
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(Capsule())
        } icon: {
            AnimeStatusView(status: status)
        }
       
    }
}

struct AnimeStatusLabel_Previews: PreviewProvider {
    static var previews: some View {
        AnimeStatusLabel(status: ("P",.blue))
    }
}
