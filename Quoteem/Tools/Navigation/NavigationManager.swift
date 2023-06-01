//
//  NavigationManager.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import UIKit

class NavigationManager {
    static let shared = NavigationManager()
    private init() {}
    private var navigationStacks = [LocalRootKind: UINavigationController]()

    func getNavigationStack(for rootKind: LocalRootKind, shouldReload: Bool = false) -> UINavigationController? {
        if !navigationStacks.keys.contains(rootKind) || shouldReload {
            navigationStacks[rootKind] = initNavigationStack(for: rootKind)
        }
        return navigationStacks[rootKind]
    }

    func cleanNavigationStack(for rootKind: LocalRootKind) {
        guard navigationStacks.keys.contains(rootKind) else {
            return
        }
        navigationStacks.removeValue(forKey: rootKind)
    }

    func cleanNavigationStacks() {
        navigationStacks = [LocalRootKind: UINavigationController]()
    }

    private func initNavigationStack(for rootKind: LocalRootKind) -> UINavigationController? {
        var viewController: UIViewController?
        switch rootKind {
        case .mainScreen:
            viewController = MainScreenModule().build()
        }
        guard viewController != nil else {
            return nil
        }
        return UINavigationController(rootViewController: viewController!)
    }
}
