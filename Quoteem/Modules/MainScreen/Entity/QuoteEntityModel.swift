//
//  QuoteEntityModel.swift
//  Quoteem
//
//  Created by Anton Klimenko on 6/1/23.
//

import Foundation

struct QuoteEntityModel: Identifiable, Hashable {
    var id: String
    var text: String
    var author: String
    var tag: String
    
    init(model: QuoteResponseModel) {
        self.id = model.id
        self.text = model.content
        self.author = model.author
        self.tag = !model.tags.isEmpty ? model.tags[0] : ""
    }
}
