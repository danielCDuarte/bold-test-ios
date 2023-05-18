//
//  APIConditionResponse.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

struct APIConditionResponse: Codable {
    var text: String
    var icon: String
    var code: Int
    
    init(text: String,
         icon: String,
         code: Int) {
        self.text = text
        self.icon = icon
        self.code = code
    }
}
