//
//  MainScreenViewModel.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import Foundation
import Combine

class MainScreenViewModel: BaseViewModel, ObservableObject {
    @Published var quote: QuoteEntityModel?
}
