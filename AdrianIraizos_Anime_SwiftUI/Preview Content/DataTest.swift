//
//  DataTest.swift
//  AdrianIraizos_Anime_SwiftUI
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import Foundation

struct FilePreview:FileLocation {
    var fileAnimesURL: URL {
           Bundle.main.url(forResource: "animeTest", withExtension: "json")!
       }
       var fileWatchedURL: URL {
           Bundle.main.url(forResource: "watchedTest", withExtension: "json")!
       }
}

extension Anime {
    static let preview = FilePreview()

}

extension AnimesViewModel {
    static let animesPreview = AnimesViewModel(persistence: ModelPersistence(fileLocation: FilePreview()))
}

extension Anime {
    static let test = Anime(title: "Gakusen Toshi Asterisk 2nd Season", description: "Invertia, la catástrife astral que aniquiló muchas ciudades en el siglo XX, supuso también el nacimiento de una nueva raza de humanos con habilidades especiales: los Genestella. Al mismo tiempo, se encontró un elemento especial en el interior del meteoro, \"maná\", que ayudó a que la humanidad diera un salto tecnológico. En Rikka, la ciudad académica sobre el agua, el \"Asterisk\" como muchos la llaman, estudiantes de seis escuelas se preparan para un torneo que se celebra anualmente y que enfrenta a los mejores estudiantes. Ayato Amagiri, de la Academia Seidoukan, se enfrentará al reto acompañado de Julis, la Bruja de las Llamas Resplandecientes.", year: 2016, type: .Anime, rate: "4.7", status: .Finalizado, followers: 10510, episodes: 12, url: URL(string:"https://www3.animeflv.net/anime/gakusen-toshi-asterisk-2nd-season")!, image: URL(string:"https://www3.animeflv.net/uploads/animes/covers/2425.jpg")!, votes: 1890, genres: "Ciencia Ficción,Comedia,Ecchi,Escolares,Fantasía,Harem,Romance,Sobrenatural")
    
    static let testShort = Anime(title: "Otaku no Video", description: "Kubo es la tipica persona a la que le agradaba estudiar, practicar deportes y salir con chicas. Un dia, su amigo Tanaka le propone asistir a su casa para poder ver unos vídeos. Es tal la impresión de Kubo al poder ver sus series favoritas, además de del hobbys de los amigos de Takana, que con el tiempo Kubo empezo a faltar a sus citas deportivas y deja de salir con chicas. Pero lo peor de todo es que se convierte en un ser antisocial que trata de dominar al mundo mediante las series de anime para convertirse en el Otaking y construir Otakulandia.", year: 1191, type: .Anime, rate: "4.5", status: .Finalizado, followers: 161, episodes: 2, url: URL(string:"https://www3.animeflv.net/anime/otaku-no-video")!, image: URL(string:"https://www3.animeflv.net/uploads/animes/covers/2021.jpg")!, votes: 2019, genres: "Ciencia Ficción,Comedia,Drama,Historico,Magia,Mecha")
    
    static let testLong = Anime(title: "Shin no Nakama ja Nai to Yuusha no Party wo Oidasareta node, Henkyou de Slow Life suru Koto ni Shima", description: "En un mundo de fantasía en el que una chica con la Protección Divina del héroe combate contra el Señor Demonio. En ese mundo, Red, el hermano mayor de esa chica, quien posee la Protección Divina del “Guía”, que solo le otorga un nivel inicial mayor que sus compañeros, acompañó al héroe en su grupo inicial. No obstante, puesto que esa Protección Divina solo le otorga un alto nivel pero no magia ni artes marciales, gradualmente no pudo equipararse al poder de sus compañeros, y al final, un compañero hechicero señaló, “tú no eres un verdadero miembro del equipo”, al mismo tiempo que lo corría de allí con todas sus cosas. Con su corazón completamente roto, Red se distanció de la batalla contra el ejército del Rey Demonio, a pesar de saber que el destino del mundo dependía de ello, y ahora apuntó a vivir una vida tranquila en la frontera, y ganar dinero abriendo una tienda de herbolaria utilizando el conocimiento adquirido durante sus viajes.", year: 2021, type: .Anime, rate: "4.6", status: .Finalizado, followers: 19628, episodes: 13, url: URL(string: "https://www3.animeflv.net/anime/shin-no-nakama-ja-nai-to-yuusha-no-party-wo-oidasareta-node-henkyou-de-slow-life-suru-koto-ni-shimas")!, image: URL(string:"https://www3.animeflv.net/uploads/animes/covers/3533.jpg")!, votes: 1749, genres: nil)
    

    
    static var watched = Anime(title: "Ajin Part 1: Shoudou",
                               description: "Los Ajin son humanos que no pueden morir que aparecieron por primera vez en un campo de batalla en África hace 17 años. Desde entonces, se han ido descubriendo más entre el resto de miembros de la sociedad humana. Al ser tan poco comunes, el gobierno está dispuesto a recompensar generosamente a cualquiera que capture a uno para sus experimentos. En el presente, la vida de un estudiante de instituto normal llamado Kei da un giro de 180 grados cuando después de un accidente mortal descubre ser un Ajin. Con ayuda de su mejor amigo, Kei intentará ocultar al resto lo que es realmente, hasta que un grupo de Ajin lo encuentra y le ofrece unirse a ellos para preparar una ofensiva contra la humanidad.",
                               year: 2015, type: .Pelicula, rate: "4.4", status: .Finalizado, followers: 1033, episodes: 1, url: URL(string:"https://www3.animeflv.net/anime/ajin-part-1-shoudou")!, image: URL(string:"https://www3.animeflv.net/uploads/animes/covers/2402.jpg")!, votes: 92, genres: nil)
}


