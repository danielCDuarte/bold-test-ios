//
//  MapperType.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

protocol MapperType {
    associatedtype Input
    associatedtype Output
    
    static func map(input: Input) -> Output
}
