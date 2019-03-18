//
//  ProfileDataStore.swift
//  FoodFindr
//
//  Created by Disha Jagtap on 3/11/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import HealthKit

class ProfileDataStore {
    
    class func getAgeAndSex() throws -> (age: Int, biologicalSex: HKBiologicalSex) {
        let healthKitStore = HKHealthStore()
        do {
            let birthdayComponents =  try healthKitStore.dateOfBirthComponents()
            let biologicalSex =       try healthKitStore.biologicalSex()
            
            let today = Date()
            let calendar = Calendar.current
            let todayDateComponents = calendar.dateComponents([.year],
                                                              from: today)
            let thisYear = todayDateComponents.year!
            let age = thisYear - birthdayComponents.year!
            
            let unwrappedBiologicalSex = biologicalSex.biologicalSex
            
            return (age, unwrappedBiologicalSex)
        }
    }
    
    class func getMostRecentSample(for sampleType: HKSampleType,
                                   completion: @escaping (HKQuantitySample?, Error?) -> Swift.Void) {
        //1. Use HKQuery to load the most recent samples.
        let mostRecentPredicate =
            HKQuery.predicateForSamples(withStart:Date.distantPast,
                                        end: Date(),
                                        options: .strictEndDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate,
                                              ascending: false)
        let limit = 1
        let sampleQuery = HKSampleQuery(sampleType: sampleType,
                                        predicate: mostRecentPredicate,
                                        limit: limit,
                                        sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            //2. Always dispatch to the main thread when complete.
            DispatchQueue.main.async {
                guard
                    let samples = samples,
                    let mostRecentSample = samples.first as? HKQuantitySample
                    else {
                        completion(nil, error)
                        return
                }
                completion(mostRecentSample, nil)
            }
        }
        HKHealthStore().execute(sampleQuery)
    }
}
