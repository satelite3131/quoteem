//
//  MainScreenService.swift
//  Quoteem
//
//  Created by Anton Klimenko on 6/1/23.
//

import Foundation

class MainScreenService: BaseService, MainScreenServiceProtocol {
    func getQuote(
        onSuccess: @escaping ([QuoteResponseModel]) -> Void,
        onFail: @escaping () -> Void
    ) {
        let url = urlBuilder.getQuote()
        self.get(url: url, onSuccess: onSuccess, onFail: onFail)
    }
}
