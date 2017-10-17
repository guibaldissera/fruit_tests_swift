//
//  FruitsManager.swift
//  Fruit Tests
//
//  Created by Guilherme Baldissera on 16/10/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class FruitsManager: NSObject {
	
	static func loadFruits(inBundle bundle: Bundle) -> [Fruits] {
		
		var fruits = [Fruits]()
		
		if let fruitsFile = bundle.path(forResource: "fruits", ofType: "plist"), let fruitsDictionary = NSArray(contentsOfFile: fruitsFile) as? [[String: String]]{
			
			for element in fruitsDictionary {
				if let fruit = Fruits(fromDictionary: element) {
					fruits.append(fruit)
				}
			}
		}
		
		return fruits
	}

    static func loadGroups(from list: [Fruits]) -> [String] {
        let groups = list.map() { $0.group }

        return Utils.sort(list: Array(Set(groups)))
    }

    static func loadNames(from list: [Fruits]) -> [String] {
        let groups = list.map() { $0.name }

        return Utils.sort(list: Array(Set(groups)))
    }

    static func filter(fruits: [Fruits], byGroup group: String) -> [String] {
        if group == "All" {
            return self.loadNames(from: fruits)
        }

        return self.loadNames(from: fruits.filter() {
            return $0.group == group
        })
    }
}
