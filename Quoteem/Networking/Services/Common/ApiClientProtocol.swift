//
//  ApiClientProtocol.swift
//  Quoteem
//
//  Created by Anton Klimenko on 6/1/23.
//

import Foundation
import Alamofire

protocol ApiClientProtocol {
    func get<T: Decodable>(
        url: String,
        requestId: UUID,
        responseType: T.Type,
        completionHandler: @escaping (AFDataResponse<T>) -> Void
    )
}

