//
//  ValoresEnvironment.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 21/9/23.
//

import SwiftUI

private struct UserDeviceKey: EnvironmentKey {
   //0 Phone, 1 Pad
    static var defaultValue: UIUserInterfaceIdiom = UIDevice.current.userInterfaceIdiom
    
}


extension EnvironmentValues {
    var userDevice: UIUserInterfaceIdiom {
        get { self[UserDeviceKey.self] }
        set { self[UserDeviceKey.self] = newValue }
    }
}

extension View {
    func userDevice(_ userDevice: UIUserInterfaceIdiom) -> some View {
        environment(\.userDevice, userDevice)
    }
}
