//
//  ObjectFactory.swift
//  Quoteem
//
//  Created by Anton Klimenko on 6/1/23.
//

import Foundation
import Swinject

class ObjectFactory {
    private static var defaultContainer: Container?
    public static func initialize(with container: Container) {
        defaultContainer = container
    }
    public static func get<Service>(type: Service.Type) -> Service? {
        defaultContainer?.resolve(type)
    }
}
