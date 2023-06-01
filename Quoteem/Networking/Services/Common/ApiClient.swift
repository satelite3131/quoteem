//
//  ApiClient.swift
//  Quoteem
//
//  Created by Anton Klimenko on 6/1/23.
//

import Foundation
import Alamofire

class ApiClient: ApiClientProtocol {
    func get<T: Decodable>(
        url: String,
        requestId: UUID,
        responseType: T.Type,
        completionHandler: @escaping (Alamofire.AFDataResponse<T>) -> Void
    ) {
        AF.request(url, method: .get)
            .responseDecodable(completionHandler: completionHandler)
    }
}
