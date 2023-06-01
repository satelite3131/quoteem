//
//  ModuleProtocol.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import Foundation

protocol ModuleProtocol {
    associatedtype View where View: ViewProtocol
    associatedtype Interactor where Interactor: InteractorProtocol
    associatedtype Presenter where Presenter: PresenterProtocol
    associatedtype Router where Router: RouterProtocol

    func assemble(interactor: Interactor, presenter: Presenter, router: Router)
}

extension ModuleProtocol {
    func assemble(interactor: Interactor, presenter: Presenter, router: Router) {
        interactor.presenter = (presenter as! Self.Interactor.InteractorPresenter)
        presenter.interactor = (interactor as! Self.Presenter.PresenterInteractor)
        presenter.router = (router as! Self.Presenter.PresenterRouter)
        router.presenter = (presenter as! Self.Router.RouterPresenter)
    }
}
