//
//  PresenterToRouterProtocolExtension.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import SwiftUI

extension PresenterToRouterProtocol {
    func goToTab(_ tab: LocalRootKind, shouldReload: Bool = false) {
        guard let newVC = NavigationManager.shared.getNavigationStack(for: tab, shouldReload: shouldReload) else {
            print("ERROR: There is no associated module with this tab: \(tab)")
            return
        }
        setRootController(newVC: newVC)
    }

    private func setRootController(newVC: UINavigationController) {
        guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
              let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return
        }
        window.rootViewController = newVC
        window.makeKeyAndVisible()
    }
}

