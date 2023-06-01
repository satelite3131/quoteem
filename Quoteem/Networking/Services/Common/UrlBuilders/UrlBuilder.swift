//
//  UrlBuilder.swift
//  Quoteem
//
//  Created by Anton Klimenko on 6/1/23.
//

class UrlBuilder: UrlBuilderProtocol {
    func getQuote() -> String {
        "https://api.quotable.io/quotes/random"
    }
}
