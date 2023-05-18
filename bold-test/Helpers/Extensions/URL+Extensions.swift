//
//  URL+Extensions.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

extension URL {
    static func getUrl(from string: String?) -> URL? {
        return URL(string: string ?? "")
    }
}
