//
//  FruitsManager.swift
//  Fruit Tests
//
//  Created by Guilherme Baldissera on 16/10/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class FruitsManager: NSObject {
	
	static func loadFruits(inBundle bundle: Bundle) -> [Fruits]? {
		
		var fruits: [Fruits]?
		
		if let fruitsFile = bundle.path(forResource: "fruits", ofType: "plist"), let fruitsDictionary = NSArray(contentsOfFile: fruitsFile) as? [[String: String]]{
			
			for element in fruitsDictionary {
				if let fruit = Fruits(fromDictionary: element) {
					fruits?.append(fruit)
				}
			}
			return fruits
		}
		
		return nil
	}
	
}
