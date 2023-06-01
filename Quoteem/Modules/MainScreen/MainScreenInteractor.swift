//
//  MainScreenInteractor.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import Foundation

class MainScreenInteractor: InteractorProtocol {
    weak var presenter: MainScreenInteractorToPresenterProtocol!
    var mainScreenService: MainScreenServiceProtocol?
    init(mainScreenService: MainScreenServiceProtocol?) {
        self.mainScreenService = mainScreenService
    }
    
    private func buildEntityModel(from apiModel: [QuoteResponseModel]) -> [QuoteEntityModel] {
        apiModel.map({ element in
            QuoteEntityModel(
                model: element
            )
        })
    }
}

extension MainScreenInteractor: MainScreenPresenterToInteractorProtocol {
    func getNewQuote() {
        mainScreenService?.getQuote(
            onSuccess: { model in
            let entity = self.buildEntityModel(from: model)
            self.presenter.onGetNewQuoteSuccess(model: entity)
        }, onFail: self.presenter.onGetNewQuoteFailed)
    }
    
}

