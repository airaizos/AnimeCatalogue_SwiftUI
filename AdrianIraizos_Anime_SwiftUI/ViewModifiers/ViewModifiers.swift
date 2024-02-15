//
//  ViewModifiers.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 22/9/23.
//

import SwiftUI

struct detailLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .font(.body)
            .padding(.bottom,3)
            .background(
                  RoundedRectangle(cornerRadius: 12)
                      .fill(Color.offWhite)
                      .shadow(color: Color.gray.opacity(0.4), radius: 20, x: -10, y: -10)
                      .shadow(color: Color.white.opacity(0.9), radius: 20, x: 10, y: 10)
                      .overlay(
                          RoundedRectangle(cornerRadius: 12)
                              .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                              .blur(radius: 1)
                              .offset(x: 2, y: 2)
                              .mask(RoundedRectangle(cornerRadius: 12).fill(LinearGradient(colors: [Color.black,Color.clear], startPoint: .topLeading, endPoint: .bottomTrailing)))
                             
                      )
                      .overlay(
                          RoundedRectangle(cornerRadius: 12)
                              .stroke(Color.white.opacity(0.9), lineWidth: 1)
                              .blur(radius: 1)
                              .offset(x: -2, y: -2)
                              .mask(RoundedRectangle(cornerRadius: 12).fill(LinearGradient(colors: [Color.black,Color.clear], startPoint: .topLeading, endPoint: .bottomTrailing)))
                          
                      )
                      .padding(.horizontal,-20)
              )
           
              .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct detailLabelInfo: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .bold()
    }
}

struct sumaryLabelInfo: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.medium)
            .bold()
    }
}

struct subtitleLabelInfo: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .minimumScaleFactor(0.7)
            .padding(.horizontal)
    }
}

struct titleLabelInfo: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
    }
}
