//
//  FruitsViewController.swift
//  Fruit Tests
//
//  Created by Guilherme Baldissera on 16/10/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class FruitsViewController: UIViewController {

	var fruits = [Fruit]()
    var fruitsNames = [String]()
    var fruitsGroups = [String]()
	
	@IBOutlet weak var groupPicker: UIPickerView!
	@IBOutlet weak var fruitsTable: UITableView!

	override func viewDidLoad() {
        super.viewDidLoad()
		self.fruits = FruitsManager.loadFruits(inBundle: Bundle.main)
        self.fruitsNames = FruitsManager.loadNames(from: self.fruits)
        self.fruitsGroups = FruitsManager.loadGroups(from: self.fruits)

        self.groupPicker.accessibilityActivate()
//        self.groupPicker.accessibilityTraits = accessibilityTrait
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
        guard let name = FruitsManager.returnNormalizedGroups(self.fruitsGroups, at: row) else {
            return "All"
        }

        return name
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.fruitsNames = FruitsManager.filter(fruits: self.fruits, byGroup: FruitsManager.returnNormalizedGroups(self.fruitsGroups, at: row))
        self.fruitsTable.reloadData()
    }
}
extension FruitsViewController: UIPickerViewAccessibilityDelegate {

    func pickerView(_ pickerView: UIPickerView, accessibilityLabelForComponent component: Int) -> String? {
        guard let name = FruitsManager.returnNormalizedGroups(self.fruitsGroups, at: component) else {
            return "All"
        }

        return name
    }


    func pickerView(_ pickerView: UIPickerView, accessibilityHintForComponent component: Int) -> String? {
        guard let name = FruitsManager.returnNormalizedGroups(self.fruitsGroups, at: component) else {
            return "All"
        }

        return name
    }
}
