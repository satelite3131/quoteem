//
//  QuoteResponseModel.swift
//  Quoteem
//
//  Created by Anton Klimenko on 6/1/23.
//

import Foundation
struct QuoteResponseModel: Codable {
    let id, content, author: String
    let tags: [String]
    let authorSlug: String
    let length: Int
    let dateAdded, dateModified: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case content, author, tags, authorSlug, length, dateAdded, dateModified
    }
}
