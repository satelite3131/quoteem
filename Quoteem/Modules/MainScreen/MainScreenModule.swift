//
//  MainScreenModule.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import UIKit

class MainScreenModule: ModuleProtocol {
    
    typealias View = MainScreenView
    typealias Interactor = MainScreenInteractor
    typealias Presenter = MainScreenPresenter
    typealias Router = MainScreenRouter

    func build() -> UIViewController {
        let interactor = MainScreenInteractor(
            mainScreenService: ObjectFactory.get(type: MainScreenServiceProtocol.self)
        )
        let presenter = MainScreenPresenter()
        let router = MainScreenRouter()
        let viewModel = MainScreenViewModel()
        let view = View(presenter: presenter, viewModel: viewModel)
        presenter.viewModel = viewModel
        self.assemble(interactor: interactor, presenter: presenter, router: router)

        let viewController = BaseController(rootView: view)
        router.viewController = viewController
        presenter.viewController = viewController
        presenter.setup()

        return viewController
        
    }
}
