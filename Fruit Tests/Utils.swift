//
//  Utils.swift
//  Fruit Tests
//
//  Created by Eduardo Vital Alencar Cunha on 17/10/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import Foundation

enum Order {
    case ascendent, descendent
}

class Utils {

    static func sort(list: [String], by order: Order = .ascendent) -> [String] {
        switch order {
        case .ascendent:
            return list.sorted() {
                return $0 <= $1
            }
        case .descendent:
            return list.sorted() {
                return $0 > $1
            }
        }
    }
}
