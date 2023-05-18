//
//  DayObject.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation

struct DayObject: Identifiable {
    let id = UUID()
    var maxtempC: String
    var mintempC: String
    var maxwindKph: String
    var condition: ConditionObject
    
    init(maxtempC: String,
         mintempC: String,
         maxwindKph: String,
         condition: ConditionObject) {
        self.maxtempC = maxtempC
        self.mintempC = mintempC
        self.maxwindKph = maxwindKph
        self.condition = condition
    }
    
}
