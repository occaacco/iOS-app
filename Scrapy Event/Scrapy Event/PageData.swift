//
//  PageData.swift
//  Scrapy Event
//
//  Created by Samuel Benko on 2023. 12. 06..
//
import Foundation

struct PageData: Codable, Identifiable {
    let name: String
    let events: [EventData]

    var id: String {
        name
    }
}

struct EventData: Codable, Identifiable {
    let id = UUID()
    let Link: String
    let Performer: String
    let Date: String
}
