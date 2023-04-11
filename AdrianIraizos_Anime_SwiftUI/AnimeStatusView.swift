//
//  FinalizadoView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct AnimeStatusView: View {
    var status:(letra:String,color:Color)
    var body: some View {
        ZStack(alignment:.bottom){
            Text(status.letra)
                .font(.caption2)
                .fontWeight(.bold)
                .background {
                    Triangle()
                        .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        .fill(status.color)
                        .opacity(0.6)
                        .frame(width: 25,height: 25)
                        .offset(y:-4)
                        
                }
        }
    }
}

struct AnimeStatusView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeStatusView(status: ("P",.blue))
    }
}
