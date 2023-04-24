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
    case OVA = "OVA", Anime = "Anime", Pelicula = "Película", Especial = "Especial", All = "Todas"
    
    var id: Obra { self }
}

extension Anime {
    var statusLetter:(String,Color) {
        switch status {
        case .EnEmision: return ("E",.blue)
        case .Finalizado: return ("F",.red)
        case .Proximamente: return ("P",.green)
        }
    }
    
    var typeLetter:(letra:String,color:Color) {
        switch type {
        case .OVA: return ("O",.indigo)
        case .Anime:return ("A",.orange)
        case .Pelicula: return ("M",.brown)
        case .Especial: return ("E",.purple)
        case .All: return ("T",.black)
        }
    }
    
    var rateDouble:Double {
        Double(rate) ?? 0
    }
    
    var searchableInfo:String {
        guard let description = description else { return "" }
        return ("\(title)\(description)\(image)\(url)")
    }
    var yearFormatted:String {
        let df = DateFormatter()
        df.dateFormat = "yyyy"
        
        guard let result = df.date(from: "\(year)") else { return "" }
        
        let yearString = df.string(from: result)
        return yearString
    }
    
    var id:String {
        "\(title)\(year)\(type)"
    }
    
    var followersFormatted:String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let formatted = numberFormatter.string(for: followers) else { return "" }
        return formatted
    }
    
    var votesString:String {
        guard let votes = votes else { return "-" }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let formatted = numberFormatter.string(for: votes) else { return "-" }
        return formatted
    }
}
