//
//  Result.swift
//  CinesofaMVVM
//
//  Created by Fabricio Rodrigo Baixo on 1/13/21.
//

import Foundation

struct Result : Codable {
    
    var id: Int = 0
    var backdropPath: String = ""
    var title: String?
    var overview = ""
    var posterPath: String = ""
    
    enum CodingKeys: String,CodingKey{
        case id
        case backdropPath = "backdrop_path"
        case title
        case overview
        case posterPath = "poster_path"
    }

}


struct ResultDataStore: Codable {
    var results: [Result]
}
