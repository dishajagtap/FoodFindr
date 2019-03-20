//
//  UserGoalsViewController.swift
//  FoodFindr
//
//  Created by Disha Jagtap on 3/16/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import UIKit

class UserGoalsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let fitnessGoalPickerData = ["Maintain Weight","Lose Weight", "Gain Weight"]
    var fitnessGoalSelectedValue = "Maintain Weight"
    var desiredWeightValue: Double = 0.0
    //set up default desired weight

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.fitnessGoalPicker.delegate = self
        self.fitnessGoalPicker.dataSource = self
        desiredWeightLabel.isHidden = true
        desiredWeightTextField.isHidden = true
        weightWarningText.isHidden = true
        
    }
    
    func numberOfComponents(in fitnessGoalPicker: UIPickerView) -> (Int) {
        return 1
    }
    
    func pickerView(_ fitnessGoalPicker: UIPickerView, numberOfRowsInComponent component: Int) -> (Int) {
        return fitnessGoalPickerData.count
    }
    
    func pickerView(_ fitnessGoalPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> (String?) {
        return fitnessGoalPickerData[row]
    }
    
    func pickerView(_ fitnessGoalPickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        fitnessGoalSelectedValue = fitnessGoalPickerData[row]
        UserHealthProfile.fitnessGoal = fitnessGoalSelectedValue
        debugPrint(fitnessGoalSelectedValue)
        debugPrint(UserHealthProfile.fitnessGoal)
        showDesiredWeightInputSection()
    }
    
    func showDesiredWeightInputSection() {
        switch fitnessGoalSelectedValue {
        case "Lose Weight":
            desiredWeightLabel.isHidden = false
            desiredWeightTextField.isHidden = false
            weightWarningText.isHidden = false
        case "Gain Weight":
            desiredWeightLabel.isHidden = false
            desiredWeightTextField.isHidden = false
            weightWarningText.isHidden = false
        default:
            desiredWeightLabel.isHidden = true
            desiredWeightTextField.isHidden = true
            weightWarningText.isHidden = true
        }
    }
    
    @IBOutlet weak var fitnessGoalPicker: UIPickerView!
    @IBOutlet weak var desiredWeightLabel: UILabel!
    @IBOutlet weak var desiredWeightTextField: UITextField!
    @IBOutlet weak var weightWarningText: UITextView!
    @IBAction func getDesiredWeightValue(_ sender: Any) {
        desiredWeightValue = NumberFormatter().number(from: desiredWeightTextField.text ?? "0.0")?.doubleValue ?? 0.0
        UserHealthProfile.desiredWeight = desiredWeightValue
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
