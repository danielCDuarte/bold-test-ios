//
//  APIDayResponse.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

struct APIDayResponse: Codable {
    var maxtempC: Float
    var mintempC: Float
    var maxwindKph: Float
    var condition: APIConditionResponse
    
    init(maxtempC: Float,
         mintempC: Float,
         maxwindKph: Float,
         condition: APIConditionResponse) {
        self.maxtempC = maxtempC
        self.mintempC = mintempC
        self.maxwindKph = maxwindKph
        self.condition = condition
    }
    
    enum CodingKeys : String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case maxwindKph = "maxwind_kph"
        case condition
    }
}
