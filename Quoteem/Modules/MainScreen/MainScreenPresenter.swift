//
//  MainScreenPresenter.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import Foundation

class MainScreenPresenter: PresenterProtocol {
    var interactor: MainScreenPresenterToInteractorProtocol!
    var router: MainScreenPresenterToRouterProtocol!
    weak var viewModel: MainScreenViewModel!
    var viewController: PresenterToControllerProtocol!
    
    func setup() {
        viewController.setupNavigationBar(
            title: "Quoteem",
            hasNavigationBar: false,
            hasBackButton: false,
            actionButtons: []
        )
        viewModel.isLoading = true
        interactor.getNewQuote()
    }
}

extension MainScreenPresenter: MainScreenViewToPresenterProtocol {
    
    func onBarTabPressed(tab: LocalRootKind, shouldReload: Bool) {
        router.goToTab(tab, shouldReload: shouldReload)
    }
    
    func getNewQuote() {
        viewModel.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.interactor.getNewQuote()
        }
    }
}

extension MainScreenPresenter: MainScreenInteractorToPresenterProtocol {
    func onGetNewQuoteSuccess(model: [QuoteEntityModel]) {
        viewModel.quote = model[0]
        viewModel.isLoading = false
    }
    
    func onGetNewQuoteFailed() {
        print("Error getting new quote")
    }
}

extension MainScreenPresenter: MainScreenRouterToPresenterProtocol {
}

extension MainScreenPresenter: MainScreenPresenterDelegate {
}

