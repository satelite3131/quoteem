//
//  PresenterToControllerProtocol.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import Foundation

protocol PresenterToControllerProtocol {
    func setupNavigationBar(
        title: String,
        hasNavigationBar: Bool,
        hasBackButton: Bool,
        onBack: (() -> Bool)?,
        actionButtons: [ActionButtonModel]?
    )
}

extension PresenterToControllerProtocol {
    func setupNavigationBar(
        title: String = "",
        hasNavigationBar: Bool = true,
        hasBackButton: Bool = false,
        onBack: (() -> Bool)? = nil,
        actionButtons: [ActionButtonModel]? = nil
    ) {
        return setupNavigationBar(
            title: title,
            hasNavigationBar: hasNavigationBar,
            hasBackButton: hasBackButton,
            onBack: onBack,
            actionButtons: actionButtons
        )
    }
}
