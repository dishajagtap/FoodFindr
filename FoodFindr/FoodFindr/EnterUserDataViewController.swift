//
//  EnterUserDataViewController.swift
//  FoodFindr
//
//  Created by Yohana Yap on 3/2/19.

import UIKit

class EnterUserDataViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Properties

    @IBOutlet weak var enterYourInforTitle: UILabel!
    @IBOutlet weak var curWeightTextField: UITextField!
    @IBOutlet weak var curHeightTF: UITextField!
    @IBOutlet weak var desWeightTF: UITextField!
    @IBOutlet weak var fitnessGoalLabel: UILabel!
    @IBOutlet weak var fitnessGoalChoicesPicker: UIPickerView! // need to change choices
    
    
    // MARK: Actions
    @IBAction func moveToDietPrefButton(_ sender: Any) {
    }
    
}

 // MARK: Navigation
 
