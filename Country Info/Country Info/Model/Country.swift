//
//  Country.swift
//  Country Info
//
//  Created by Artem on 20.10.2021.
//

import Foundation

struct Country: Codable {
    let name: String?
    let capital: String?
    let flags: Flags?
    
}

struct Flags: Codable {
    let png: String
}
