//
//  MainScreenProtocols.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import Foundation

protocol MainScreenViewToPresenterProtocol: ViewToPresenterProtocol {
    func onBarTabPressed(tab: LocalRootKind, shouldReload: Bool)
    func getNewQuote()
}

protocol MainScreenInteractorToPresenterProtocol: InteractorToPresenterProtocol {
    func onGetNewQuoteSuccess(model: [QuoteEntityModel])
    func onGetNewQuoteFailed()
}

protocol MainScreenPresenterToRouterProtocol: PresenterToRouterProtocol {
}

protocol MainScreenPresenterToInteractorProtocol: PresenterToInteractorProtocol {
    func getNewQuote()
}

protocol MainScreenRouterToPresenterProtocol: RouterToPresenterProtocol {
}

protocol MainScreenPresenterDelegate: AnyObject {
}

