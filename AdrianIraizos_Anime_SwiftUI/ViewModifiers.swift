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
