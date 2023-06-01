//
//  BaseService.swift
//  Quoteem
//
//  Created by Anton Klimenko on 6/1/23.
//

import Foundation

class BaseService: BaseServiceProtocol {
    internal let urlBuilder: UrlBuilderProtocol
    internal let apiClient: ApiClientProtocol

    init (urlBuilder: UrlBuilderProtocol, apiClient: ApiClientProtocol) {
        self.urlBuilder = urlBuilder
        self.apiClient = apiClient
    }

    internal func get<T: Decodable>(
            url: String,
            onSuccess: @escaping (T) -> Void,
            onFail: @escaping () -> Void
    ) {
        let requestId = UUID()
        apiClient.get(url: url, requestId: requestId, responseType: T.self) { response in
            switch response.result {
            case .success(let result):
                onSuccess(result)
            case .failure:
                print(onFail, requestId)
            }
        }
    }
}
