//
//  PersistenceTests.swift
//  AdrianIraizos_Anime_SwiftUITests
//
//  Created by Adrian Iraizos Mendoza on 25/9/23.
//

import Foundation

//Subclass para tests

@testable import AdrianIraizos_Anime_SwiftUI
final class PersistenceTest: ModelPersistence {
   
    override init(fileLocation: FileLocation = FileTests()) {
        super.init()
        self.fileLocation = fileLocation
    }
    
}
