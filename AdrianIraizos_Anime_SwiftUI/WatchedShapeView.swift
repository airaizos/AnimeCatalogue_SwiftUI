//
//  WatchedView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 17/4/23.
//

import SwiftUI

struct WatchedShapeView: View {
    var isHighlighted:Bool
    
    var body: some View {
        Image(systemName: isHighlighted ? "eye" : "eye.slash")
            .font(.subheadline)
            .foregroundColor(.gray)
            .padding(5)
            .contentShape(Polygon(sides:6))
            .background(
             NeumorphicViewStyle(isHighlighted: isHighlighted, shape: Polygon(sides: 6))
            )
    }
}

struct WatchedSHapeView_Previews: PreviewProvider {
    static var previews: some View {
        WatchedShapeView(isHighlighted: true)
            
    }
}

struct ColorfullBackground<S:Shape>: View {
    var isHighlighted: Bool
    var shape:S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(colors: [Color.pinkEnd,Color.pinkStart], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .overlay(shape.stroke(LinearGradient(colors: [Color.pinkEnd,Color.pinkStart], startPoint: .topLeading, endPoint: .bottomTrailing),lineWidth: 4))
                    .shadow(color:Color.gray, radius: 10 ,x:5,y:5)
                    .shadow(color:Color.white,radius:10, x:-5, y:-5)
            } else {
                shape
                    .fill(LinearGradient(colors: [Color.pinkStart,Color.pinkEnd], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .overlay(shape.stroke(LinearGradient(colors: [Color.pinkStart,Color.pinkEnd], startPoint: .topLeading, endPoint: .bottomTrailing),lineWidth: 4))
                    .shadow(color:Color.gray, radius: 10 ,x:5,y:5)
                    .shadow(color:Color.white,radius:10, x:-5, y:-5)
            }
        }
        .animation(nil, value: 0)
    }
    
}
