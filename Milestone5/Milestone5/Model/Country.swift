//
//  Conutry.swift
//  Milestone5
//
//  Created by Ceren Güneş on 12.12.2023.
//

import Foundation

struct Countries: Codable {
    let countries: [Country]
}

struct Country: Codable {
    let countryName: String
    let countryCode: String
    let countryPopulation: Int
    let countryFlag: String
    let countryDetail: String
}

