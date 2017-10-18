//
//  Fruits.swift
//  Fruit Tests
//
//  Created by Guilherme Baldissera on 16/10/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

struct Fruit {
	var name: String
	var group: String
	
	init?(fromDictionary dictionary: [String: String]) {
		guard let name = dictionary["name"],
			let group = dictionary["group"] else {
			return nil
		}
		
		self.name = name
		self.group = group
	}

    init(name: String, group: String) {
        self.name = name
        self.group = group
    }
}
