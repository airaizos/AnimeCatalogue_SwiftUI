//
//  Anime.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import Foundation


public struct Anime:Codable {
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

enum Obra:String,Codable {
    case OVA = "OVA", Anime = "Anime", Pelicula = "Película", Especial = "Especial"
}


extension Anime {
    static let test = Anime(title: "Gakusen Toshi Asterisk 2nd Season", description: "Invertia, la catástrife astral que aniquiló muchas ciudades en el siglo XX, supuso también el nacimiento de una nueva raza de humanos con habilidades especiales: los Genestella. Al mismo tiempo, se encontró un elemento especial en el interior del meteoro, \"maná\", que ayudó a que la humanidad diera un salto tecnológico. En Rikka, la ciudad académica sobre el agua, el \"Asterisk\" como muchos la llaman, estudiantes de seis escuelas se preparan para un torneo que se celebra anualmente y que enfrenta a los mejores estudiantes. Ayato Amagiri, de la Academia Seidoukan, se enfrentará al reto acompañado de Julis, la Bruja de las Llamas Resplandecientes.", year: 2016, type: .Anime, rate: "4.7", status: .Finalizado, followers: 10510, episodes: 12, url: URL(string:"https://www3.animeflv.net/anime/gakusen-toshi-asterisk-2nd-season")!, image: URL(string:"https://www3.animeflv.net/uploads/animes/covers/2425.jpg")!, votes: nil, genres: "Ciencia Ficción,Comedia,Ecchi,Escolares,Fantasía,Harem,Romance,Sobrenatural")
}
