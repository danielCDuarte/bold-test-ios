//
//  BaseViewModel.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation

class BaseViewModel: NSObject, BaseViewModelProtocol, ErrorProcessorProtocol {
    var view: BaseView?
    weak var errorHandler: ErrorHandlerProtocol?
    
    var loading: Bool = false {
        didSet {
            if self.loading {
            } else {}
        }
    }
    
    func bind(withView view: BaseView) {
        self.view = view
        self.errorHandler = view
    }
    
    func unBind() {
        self.view = nil
        self.errorHandler = nil
    }
    
    func viewAppear() {}
    
    func viewDidAppear() {}
    
    func getInitialState() {}
}
