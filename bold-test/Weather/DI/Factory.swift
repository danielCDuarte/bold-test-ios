//
//  Factory.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation
import Resolver

protocol FactoryProtocol {
    init(baseUrl: String)
}

class Factory: FactoryProtocol {
    
    required init(baseUrl: String) {
        Resolver.RegisterModuleDependencies(with: baseUrl)
    }
}
