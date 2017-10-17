//
//  FruitsViewController.swift
//  Fruit Tests
//
//  Created by Guilherme Baldissera on 16/10/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class FruitsViewController: UIViewController {

	var fruits = [Fruits]()
    var fruitsNames = [String]()
    var fruitsGroups = [String]()
	
	@IBOutlet weak var groupPicker: UIPickerView!
	@IBOutlet weak var fruitsTable: UITableView!

    func pickerGroupOf(row: Int) -> String {
        return (row == 0) ? "All" : self.fruitsGroups[row - 1]
    }

	override func viewDidLoad() {
        super.viewDidLoad()
		self.fruits = FruitsManager.loadFruits(inBundle: Bundle.main)
        self.fruitsNames = FruitsManager.loadNames(from: self.fruits)
        self.fruitsGroups = FruitsManager.loadGroups(from: self.fruits)
    }
}

extension FruitsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fruitsNames.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "fruitCell")!
		cell.textLabel?.text = fruitsNames[indexPath.row]
		
		return cell
	}
	
}

extension FruitsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.fruitsGroups.count + 1
    }


}

extension FruitsViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerGroupOf(row: row)
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.fruitsNames = FruitsManager.filter(fruits: self.fruits, byGroup: self.pickerGroupOf(row: row))
        self.fruitsTable.reloadData()
    }
}

