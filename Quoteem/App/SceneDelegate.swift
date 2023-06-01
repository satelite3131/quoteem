//
//  SceneDelegate.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        ObjectFactory.initialize(with: DIContainerBuilder.build())
        NavigationBarAppearance.initialize()

        guard let windowScene = scene as? UIWindowScene else {
            return
        }

        let navigationController = getInitController()

        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = navigationController
        window.tintColor = .systemRed
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

    private func getInitController() -> UINavigationController {
        return NavigationManager.shared.getNavigationStack(for: .mainScreen)!
    }
}

