//
//  DietPreferencesVC.swift
//  FoodFindr
//
//  Created by Yohana Yap on 3/2/19.

import UIKit

class DietPreferencesVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Properties
    @IBOutlet weak var enterDietInfoTitle: UILabel!
    @IBOutlet weak var dietPrefLabel: UILabel!
    @IBOutlet weak var allergiesLabel: UILabel!
    @IBOutlet weak var dietPrefPicker: UIPickerView!
    @IBOutlet weak var allergiesPicker: UIPickerView!
   
    // MARK: Actions

    @IBAction func doneCreatingAcctButton(_ sender: UIButton) {
    }
}

 // MARK: Navigation
 
