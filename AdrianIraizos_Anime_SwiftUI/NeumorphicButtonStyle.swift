//
//  NeumorphicButtonStyle.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 17/4/23.
//

import SwiftUI


struct NeumorphicButtonStyle: ButtonStyle {
    var isActive:Bool
    let shape = RoundedRectangle(cornerRadius: 10)
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(5)
            .background(
                Group {
                    if configuration.isPressed {
                        shape
                            .fill(Color.offWhite)
                            .overlay(
                                shape
                                    .stroke(Color.gray,lineWidth:4)
                                    .blur(radius:4)
                                    .offset(x:2, y:2)
                                    .mask(shape.fill(LinearGradient(colors: [Color.black,Color.clear], startPoint: .topLeading, endPoint: .bottomTrailing)))
                            )
                    } else {
                        shape
                            .fill(Color.offWhite)
                            .shadow(color:Color.black.opacity(0.2), radius: 10, x:10, y:10)
                            .shadow(color:Color.white.opacity(0.7), radius: 10, x:5, y:5)
                    }
                }
            )
           
    }
}
