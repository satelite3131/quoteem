//
//  NavigationBarAppearance.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import UIKit

class NavigationBarAppearance {
    public static func initialize() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 30) as Any, .foregroundColor: UIColor.black]
        appearance.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 18) as Any, .foregroundColor: UIColor.black]
        
        let stackViewAppearance = UIStackView.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
        stackViewAppearance.spacing = -8
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .white

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
