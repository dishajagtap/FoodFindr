//
//  HealthKitSetupAssistant.swift
//  FoodFindr
//
//  Created by Disha Jagtap on 3/16/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import HealthKit


class HealthKitSetupAssistant {
    public static let healthStore = HKHealthStore()
    
    static func authorizeHealthKit() {
        if HKHealthStore.isHealthDataAvailable() {
            let infoToRead = Set([
                HKSampleType.characteristicType(forIdentifier: .biologicalSex)!,
                HKSampleType.characteristicType(forIdentifier: .dateOfBirth)!,
                HKSampleType.quantityType(forIdentifier: .height)!,
                HKSampleType.quantityType(forIdentifier: .bodyMass)!,
                HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!
                ])
            
            healthStore.requestAuthorization(toShare: nil, read: infoToRead) { (success, error) in
                if !success {
                    // Handle the error here.
                }
            }
        }
    }
}
