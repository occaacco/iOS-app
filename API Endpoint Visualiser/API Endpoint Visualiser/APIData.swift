//
//  APIData.swift
//  API Endpoint Visualiser
//
//  Created by Samuel Benko on 2023. 12. 05..
//

// APIData.swift

import Foundation

struct APIData: Codable {
    let entries: [APIEntry]
}

struct APIEntry: Codable {
    let API: String
    let Description: String
    let Auth: String
    let HTTPS: Bool
    let Cors: String
    let Link: String
    let Category: String
}

