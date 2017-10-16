//
//  FruitsViewController.swift
//  Fruit Tests
//
//  Created by Guilherme Baldissera on 16/10/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class FruitsViewController: UIViewController {

	var fruits: [Fruits]?
	
	@IBOutlet weak var groupPicker: UIPickerView!
	@IBOutlet weak var fruitsTable: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.fruits = FruitsManager.loadFruits(inBundle: Bundle.main)
    }
}

extension FruitsViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let count = fruits?.count {
			return count
		}
		
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "fruitCell")!
		cell.textLabel?.text = fruits![indexPath.row].name
		
		return cell
	}
	
}
