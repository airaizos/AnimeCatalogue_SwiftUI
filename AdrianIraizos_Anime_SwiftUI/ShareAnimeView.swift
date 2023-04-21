//
//  ShareAnimeView.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 21/4/23.
//

import SwiftUI


struct ShareAnimeView: UIViewControllerRepresentable {
    let anime:Anime
    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareAnimeView>) -> some UIActivityViewController {
        let activityItems:[Any] = [anime.title,anime.image]
        
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return activityController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
