//
//  BaseController.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import SwiftUI

class BaseController<T>: UIHostingController<T> where T: View {
    var hasNavigationBar: Bool = true
    var hasBackButton: Bool = true
    var onBack: (() -> Bool)?
    var actionButtons: [ActionButtonModel]?
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(rootView: T) {
        super.init(rootView: rootView)
    }
    
    override func viewDidLoad() {
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(!hasNavigationBar, animated: false)
        navigationItem.hidesBackButton = !hasBackButton
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic

        configureRightButtons()
        if onBack != nil {
            let backIcon = UIImage(
                systemName: "chevron.left",
                withConfiguration: UIImage.SymbolConfiguration(weight: .semibold)
            )
            let customBackButton = UIBarButtonItem(image: backIcon,
                style: .plain,
                target: self,
                action: #selector(backAction(sender:))
            )
            customBackButton.imageInsets = UIEdgeInsets(top: 2, left: -8, bottom: 0, right: 0)
            navigationItem.leftBarButtonItem = customBackButton
        }
    }
    @objc private func backAction(sender: UIBarButtonItem) {
        if onBack != nil && onBack!() {
            navigationController?.popViewController(animated: true)
        }
    }
    
    func configureRightButtons () {
        guard let rightButtons = actionButtons else {
            return
        }
        var itemsArray: [UIBarButtonItem] = []
        for (index, btn) in rightButtons.enumerated() {
            let rightButtonItem: UIBarButtonItem
            rightButtonItem = configureBarButton(id: index, type: btn.type, btn: btn)
            itemsArray.append(rightButtonItem)
            navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        }
        navigationItem.rightBarButtonItems = itemsArray
        
    }
    
    func configureBarButton (id: Int, type: ActionButtonType, btn: ActionButtonModel) -> UIBarButtonItem {
        let rightButtonItem: UIBarButtonItem
        
        switch type {
        case .string:
            rightButtonItem = UIBarButtonItem(
                title: btn.title,
                style: .plain,
                target: self,
                action: #selector(rightButtonAction)
            )
            let actionButtonAttributes =
                [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .black) as Any,
                    NSAttributedString.Key.foregroundColor: UIColor.black
                ]
            rightButtonItem.setTitleTextAttributes(actionButtonAttributes, for: .disabled)
            rightButtonItem.setTitleTextAttributes(actionButtonAttributes, for: .focused)
            rightButtonItem.setTitleTextAttributes(actionButtonAttributes, for: .highlighted)
            rightButtonItem.setTitleTextAttributes(actionButtonAttributes, for: .normal)
        default:
            rightButtonItem = UIBarButtonItem(
                image: UIImage(named: btn.image.rawValue),
                style: .plain,
                target: self,
                action: #selector(rightButtonAction)
            )
        }

        switch id {
        case 0: rightButtonItem.action = #selector(rightButtonAction)
        case 1: rightButtonItem.action = #selector(secondButtonAction)
        default: rightButtonItem.action = #selector(leftButtonAction)
        }
        return rightButtonItem
    }
    
    @objc func rightButtonAction () {
        actionButtons?[0].action()
    }
    @objc private func secondButtonAction() {
        actionButtons?[1].action()
    }
    @objc private func leftButtonAction() {
        actionButtons?[2].action()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

extension BaseController: PresenterToControllerProtocol {
    func setupNavigationBar(
        title: String = "",
        hasNavigationBar: Bool = true,
        hasBackButton: Bool = false,
        onBack: (() -> Bool)? = nil,
        actionButtons: [ActionButtonModel]? = nil
    ) {
        self.title = title
        self.hasNavigationBar = hasNavigationBar
        self.hasBackButton = hasBackButton
        self.onBack = onBack
        self.actionButtons = actionButtons
    }
}
extension BaseController: RouterToControllerProtocol {
    func performBack() {
        navigationController?.popViewController(animated: true)
    }
}

