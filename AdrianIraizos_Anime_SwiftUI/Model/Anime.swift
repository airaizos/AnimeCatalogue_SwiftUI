//
//  Anime.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import SwiftUI

struct Anime:Codable,Hashable,Identifiable {

    let title:String
    let description:String?
    let year:Int
    let type:Obra
    let rate:String
    let status:Estatus
    let followers:Int
    let episodes:Int
    let url:URL
    let image:URL
    let votes:Int?
    let genres:String?
    
    enum CodingKeys: String, CodingKey {
        case title,description,year,type, rate = "rate_start",status,followers,episodes, url = "url_anime",image,votes,genres
    }
}

enum Estatus:String,Codable {
    case EnEmision = "En emision", Finalizado = "Finalizado", Proximamente = "Proximamente"
}

enum Obra:String,Codable,CaseIterable,Identifiable {
    case OVA = "OVA", Anime = "Anime", Pelicula = "Película", Especial = "Especial", Todos = "Todas"
    
    var id: Obra { self }
}

extension Anime {

    var statusIcon: String {
        status.rawValue.prefix(1).uppercased()
    }
    
    var typeIcon: String {
        type.rawValue.prefix(1).uppercased()
    }
    
    var rateDouble: Double { Double(rate) ?? 0 }
    
    var searchableInfo:String { ("\(title)\(description ?? "")\(image)\(url)") }
    var yearFormatted:String { "\(year)" }
    
    var id:String { "\(title)\(year)\(type)" }
    
    var numberFormatter: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }
    
    var followersFormatted: String {
       numberFormatter.string(for: followers) ?? ""
    }
    
    var votesString: String {
        numberFormatter.string(for: votes)  ?? ""
    }
    
    
    var genreView:String {
        genres?.replacingOccurrences(of: ",", with: ", ") ?? ""
    }
}

struct IconLabel {
    let name: String
    let color: Color
    
    init(_ name: String, _ color: Color) {
        self.name = name
        self.color = color
    }
}

