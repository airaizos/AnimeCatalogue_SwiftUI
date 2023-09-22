//
//  ExtDevice.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 22/9/23.
//

import SwiftUI

extension UIDevice {
    static var bounds:CGRect {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?
            .frame ?? .zero
    }
}
