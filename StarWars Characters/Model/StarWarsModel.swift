//
//  StarWarsModel.swift
//  StarWars Characters
//
//  Created by Marcus Monteiro on 18/08/24.
//

import Foundation

struct StarWarsModel: Decodable {
    let count: Int?
    let next: String?
    let previous: Int?
    let results: [Characters]?
}

// MARK: - Characters

struct Characters: Decodable, Hashable {
    let name, height, mass, hair_color: String?
    let skin_color, eye_color, birth_year: String?
    let gender: Gender
    let homeworld: String
    let films, species, vehicles, starships: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hair_color = "hair_color"
        case skin_color = "skin_color"
        case eye_color = "eye_color"
        case birth_year = "birth_year"
        case gender, homeworld, films, species, vehicles, starships, created, edited, url
    }
}

enum Gender: String, Decodable {
    case female = "female"
    case male = "male"
    case nA = "n/a"
}
