//
//  ErrorHandlerProtocol.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

protocol ErrorHandlerProtocol: AnyObject {
    func showError(error: Error)
}

protocol ErrorProcessorProtocol {
    var errorHandler: ErrorHandlerProtocol? { get set }
}
