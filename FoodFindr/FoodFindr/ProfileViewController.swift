//
//  ProfileTableViewController.swift
//  FoodFindr
//
//  Created by Disha Jagtap on 3/12/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import UIKit
import HealthKit

class ProfileViewController: UITableViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        updateHealthInfo()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    @IBOutlet weak var ageValue: UILabel!
    @IBOutlet weak var biologicalSexValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var bmiValue: UILabel!
    @IBOutlet weak var bmrValue: UILabel!
    @IBOutlet weak var fitnessGoalValue: UILabel!
    @IBOutlet weak var desiredWeightValue: UILabel!
    @IBOutlet weak var dietPreferencesValue: UILabel!
    
    private func updateHealthInfo() {
        loadAndDisplayAgeAndSex()
        loadAndDisplayMostRecentWeight()
        loadAndDisplayMostRecentHeight()
    }
    
    private func loadAndDisplayAgeAndSex() {
        do {
            let userAgeAndSex = try ProfileDataStore.getAgeAndSex()
            UserHealthProfile.age = userAgeAndSex.age
            UserHealthProfile.biologicalSex = userAgeAndSex.biologicalSex
            updateLabels()
        } catch {
            
        }
    }
    
    private func loadAndDisplayMostRecentWeight() {
        guard let weightSampleType = HKSampleType.quantityType(forIdentifier: .bodyMass) else {
            print("Body Mass Sample Type is no longer available in HealthKit")
            return
        }
        
        ProfileDataStore.getMostRecentSample(for: weightSampleType) { (sample, error) in
            guard let sample = sample else {
                return
            }
            
            let weight = sample.quantity.doubleValue(for: HKUnit.pound())
            UserHealthProfile.currentWeight = weight
            self.updateLabels()
        }
    }
    
    private func loadAndDisplayMostRecentHeight() {
        //1. Use HealthKit to create the Height Sample Type
        guard let heightSampleType = HKSampleType.quantityType(forIdentifier: .height) else {
            print("Height Sample Type is no longer available in HealthKit")
            return
        }
        
        ProfileDataStore.getMostRecentSample(for: heightSampleType) { (sample, error) in
            guard let sample = sample else {
                return
            }
            //2. Convert the height sample to meters, save to the profile model,
            //   and update the user interface.
            let height = sample.quantity.doubleValue(for: HKUnit.inch())
            UserHealthProfile.height = height
            self.updateLabels()
        }
    }
    
    
    private func updateLabels() {
        if let age = UserHealthProfile.age {
            ageValue.text = "\(age)"
        }
        
        if let biologicalSex = UserHealthProfile.biologicalSex {
            biologicalSexValue.text = "\(getSexEnumValue(biologicalSex: biologicalSex))"
        }
        
        if let weight = UserHealthProfile.currentWeight {
            weightValue.text = "\(weight) pounds"
        }
        
        if let height = UserHealthProfile.height {
            heightValue.text = "\(height) inches"
        }
        
        if let bmi = UserHealthProfile.bodyMassIndex {
            bmiValue.text = "\(bmi)"
        }
        
        if let fg = UserHealthProfile.fitnessGoal {
            fitnessGoalValue.text = "\(fg)"
        }
        
        if UserHealthProfile.fitnessGoal == "Maintain Weight" {
            if let weight = UserHealthProfile.currentWeight {
                desiredWeightValue.text = "\(weight)"
            }
        } else {
            if let dw = UserHealthProfile.desiredWeight {
                desiredWeightValue.text = "\(dw)"
            }
        }
        
        if !UserHealthProfile.dietPreferences.isEmpty {
            dietPreferencesValue.text = "\(UserHealthProfile.dietPreferences[0])"
        }
        
        if let bmr = UserHealthProfile.basalMetabolicRate {
            bmrValue.text = "\(bmr)"
        }
    }
    
    private func getSexEnumValue(biologicalSex: HKBiologicalSex) -> (String) {
        switch biologicalSex.rawValue{
        case 0:
            return "nil"
        case 1:
            return "Female"
        case 2:
            return "Male"
        case 3:
            return "Other"
        default:
            return "nil"
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    /*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    */

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
