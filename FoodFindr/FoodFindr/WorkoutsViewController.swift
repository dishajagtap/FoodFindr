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
    
    public let healthStore = HKHealthStore()
    
    func authorizeHealthKit() {
        if HKHealthStore.isHealthDataAvailable() {
            let infoToRead = Set([
                HKSampleType.characteristicType(forIdentifier: .biologicalSex)!,
                HKSampleType.characteristicType(forIdentifier: .dateOfBirth)!,
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
        authorizeHealthKit()
        //this should get replaced later depending on the tab view
    }
}
