//
//  NASA.swift
//  NASAProject
//
//  Created by Nigel Gee on 20/12/2021.
//

import Foundation

struct NASA: Codable {
    let collection: Collection
}

struct Collection: Codable {
    let items: [Item]
}

struct Item: Codable, Identifiable {
    let data: [Data]
    let links: [Link]

    var id: UUID {
        UUID()
    }
}

// Image Details
struct Data: Codable {
    let location: String
    let dateCreated: Date
    let description: String
}

//Image Thumbnail
struct Link: Codable {
    let href: String
}


