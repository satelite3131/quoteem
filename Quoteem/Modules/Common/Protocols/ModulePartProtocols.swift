//
//  ModulePartProtocols.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import Foundation

protocol ViewProtocol {
    associatedtype ViewPresenter
    var presenter: ViewPresenter! { get set }
}

protocol InteractorProtocol: PresenterToInteractorProtocol {
    associatedtype InteractorPresenter
    var presenter: InteractorPresenter! { get set }
}

protocol PresenterProtocol: ViewToPresenterProtocol & InteractorToPresenterProtocol & RouterToPresenterProtocol {
    associatedtype PresenterInteractor
    associatedtype PresenterRouter

    var interactor: PresenterInteractor! { get set }
    var router: PresenterRouter! { get set }
}

protocol RouterProtocol: PresenterToRouterProtocol {
    associatedtype RouterPresenter

    var presenter: RouterPresenter! { get set }
}
