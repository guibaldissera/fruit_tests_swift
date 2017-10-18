//
//  FruitsManager.swift
//  Fruit Tests
//
//  Created by Guilherme Baldissera on 16/10/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class FruitsManager: NSObject {
	
	static func loadFruits(inBundle bundle: Bundle) -> [Fruit] {
		
		var fruits = [Fruit]()
		
		if let fruitsFile = bundle.path(forResource: "fruits", ofType: "plist"), let fruitsDictionary = NSArray(contentsOfFile: fruitsFile) as? [[String: String]]{
			
			for element in fruitsDictionary {
				if let fruit = Fruit(fromDictionary: element) {
					fruits.append(fruit)
				}
			}
		}
		
		return fruits
	}

    static func loadGroups(from list: [Fruit]) -> [String] {
        let groups = list.map() { $0.group }

        return Utils.sort(list: Array(Set(groups)))
    }

    static func loadNames(from list: [Fruit]) -> [String] {
        let groups = list.map() { $0.name }

        return Utils.sort(list: Array(Set(groups)))
    }

    static func filter(fruits: [Fruit], byGroup group: String? = nil) -> [String] {
        guard let group = group else {
            return self.loadNames(from: fruits)
        }

        return self.loadNames(from: fruits.filter() {
            return $0.group == group
        })
    }

    static func returnNormalizedGroups(_ groups: [String], at position: Int) -> String? {
        return (position == 0) ? nil : groups[position - 1]
    }
}
