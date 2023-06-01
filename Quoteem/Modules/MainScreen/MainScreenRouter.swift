//
//  MainScreenRouter.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import SwiftUI

class MainScreenRouter: RouterProtocol {
    weak var presenter: MainScreenRouterToPresenterProtocol!
    weak var viewController: UIViewController?
}

extension MainScreenRouter: MainScreenPresenterToRouterProtocol {
}
