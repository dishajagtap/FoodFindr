//
//  ViewController.swift
//  FoodFindr
//
//  Created by Disha Jagtap on 1/17/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import UIKit
import HealthKit

class WorkoutsViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    public let healthStore = HKHealthStore()
    
    func authorizeHealthKit() {
        if HKHealthStore.isHealthDataAvailable() {
            let infoToRead = Set([
                HKSampleType.characteristicType(forIdentifier: .biologicalSex)!,
                HKSampleType.characteristicType(forIdentifier: .dateOfBirth)!,
                HKSampleType.quantityType(forIdentifier: .height)!,
                HKSampleType.quantityType(forIdentifier: .bodyMass)!,
                HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!,
                HKSampleType.quantityType(forIdentifier: .appleExerciseTime)!,
                HKSampleType.workoutType()
                ])
            
            healthStore.requestAuthorization(toShare: infoToRead as? Set<HKSampleType>, read: infoToRead) { (success, error) in
                if !success {
                    // Handle the error here.
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Workouts"
        authorizeHealthKit()
        //this should get replaced later depending on the tab view
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    @IBOutlet weak var caloriesBurnedLabel: UILabel!
    @IBOutlet weak var exerciseMinutesLabel: UILabel!

    @IBOutlet weak var caloriesBurnedText: UITextField!
    @IBOutlet weak var exerciseMinutesText: UITextField!
}
