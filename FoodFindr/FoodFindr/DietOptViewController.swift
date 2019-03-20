//
//  DietOptViewController.swift
//  FoodFindr
//
//  Created by Tania Yap on 3/18/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import UIKit

class DietOptViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activityLevelPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activityLevelPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        activityLevelSelectedValue = activityLevelPickerData[row]
        UserHealthProfile.activeLifestyle = activityLevelSelectedValue
        debugPrint(activityLevelSelectedValue)
        debugPrint(UserHealthProfile.activeLifestyle)
    }
    
    let activityLevelPickerData = ["Active", "Moderately Active", "Inactive"]
    var activityLevelSelectedValue = "Moderately Active"
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var doneButton: UIButton!
    @IBAction func btnToTabBar(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
}
