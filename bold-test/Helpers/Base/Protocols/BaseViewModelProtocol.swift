//
//  BaseViewModelProtocol.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation

protocol BaseViewModelProtocol {
    
    var view: BaseView? {get set}
    
    func bind(withView view: BaseView)
    func unBind()
    func viewAppear()
    func viewDidAppear()
    func getInitialState()
}
