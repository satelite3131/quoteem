//
//  ActionButtonModel.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import Foundation

struct ActionButtonModel {
    let type: ActionButtonType
    var title: String = ""
    var image: ActionButtonImageType = .info
    let action: () -> Void
}

