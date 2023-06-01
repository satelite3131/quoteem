//
//  MainScreenServiceProtocol.swift
//  Quoteem
//
//  Created by Anton Klimenko on 6/1/23.
//

import Foundation

protocol MainScreenServiceProtocol {
    func getQuote(
        onSuccess: @escaping ([QuoteResponseModel]) -> Void,
        onFail: @escaping () -> Void
    )
}
