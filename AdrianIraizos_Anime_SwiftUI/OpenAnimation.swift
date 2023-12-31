//
//  OpenAnimation.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 20/4/23.
//

import SwiftUI


struct OpenAnimation:ViewModifier {
    @Binding var launch:Bool
    let step:Int
    let totalSteps:Int
    func body(content:Content) -> some View {
     content
            .opacity(launch ? 0 : 1)
            .offset(x: launch ? (step % 2 == 0 ? UIDevice.bounds.width : -UIDevice.bounds.width)  : 0)
            .animation(.spring().delay(launch ? 0.1 * Double(step) : Double(totalSteps) * 0.1), value: launch)
    }
}




