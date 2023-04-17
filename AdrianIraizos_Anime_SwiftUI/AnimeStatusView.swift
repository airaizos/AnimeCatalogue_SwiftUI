//
//  FinalizadoView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct AnimeStatusView: View {
    var status:(letra:String,color:Color)
    var size:infoSize = .small
    
    var body: some View {
        ZStack(alignment:.bottom){
            Text(status.letra)
                .font(size.fontSize)
                .fontWeight(.bold)
                
                .background {
                    Triangle()
                        .stroke(style: StrokeStyle(lineWidth: size.rawValue * 1.5, lineCap: .round, lineJoin: .round))
                        .fill(status.color)
                        .opacity(0.6)
                        .frame(width: 15 * size.rawValue,height: 15 * size.rawValue)
                        .offset(y:-2 * size.rawValue)
                        
                }
        }
        .padding(10)
    }
}

struct AnimeStatusView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeStatusView(status: ("P",.blue))
    }
}
