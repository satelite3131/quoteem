//
//  DIContainerBuilder.swift
//  Quoteem
//
//  Created by Anton Klimenko on 6/1/23.
//

import Foundation
import Swinject

class DIContainerBuilder {
    public static func build() -> Container {
        let container = Container()
        container.register(UrlBuilderProtocol.self, factory: { _ -> UrlBuilderProtocol in
            UrlBuilder()
        })
        container.register(ApiClientProtocol.self, factory: { _ -> ApiClientProtocol in
            ApiClient()
        })
        container.register(BaseServiceProtocol.self, factory: { (resolver: Resolver) -> BaseServiceProtocol in
            BaseService(
                urlBuilder: resolver.resolve(UrlBuilderProtocol.self)!,
                apiClient: resolver.resolve(ApiClientProtocol.self)!
            )
        })
        container.register(MainScreenServiceProtocol.self, factory: { (resolver: Resolver) -> MainScreenServiceProtocol in
            MainScreenService(
                urlBuilder: resolver.resolve(UrlBuilderProtocol.self)!,
                apiClient: resolver.resolve(ApiClientProtocol.self)!
            )
        })
        return container
    }
}
