//
//  ActiveEnergyBurnedDataStore.swift
//  FoodFindr
//
//  Created by Disha Jagtap on 3/14/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import HealthKit

class ActiveEnergyBurnedDataStore {
    
    public static let activeEnergyBurnedProfile = ActiveEnergyBurnedProfile()
        
    static func fetchActiveEnergyBurned() {
        //For Start Date
        let calendar = Calendar.current
        let startDateTime = calendar.startOfDay(for: Date())
        
        //For End Date
        var components = DateComponents()
        components.day = 1
        components.second = -1
        let endDateTime = calendar.date(byAdding: components, to: startDateTime)
        
        var totalEnergy = 0.0
        let energySampleType = HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: startDateTime, end: endDateTime, options: [])
        let energyQuery = HKSampleQuery(sampleType: energySampleType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil, resultsHandler: { (query, summaries, error) in
            
            guard let summaries = summaries, summaries.count > 0
                else {
                    // No data returned. Perhaps check for error
                    return
            }
            
            for activity in summaries as! [HKQuantitySample] {
                totalEnergy += activity.quantity.doubleValue(for: HKUnit.kilocalorie())
            }
            
            activeEnergyBurnedProfile.activeEnergyBurned = totalEnergy
            
        })
        HealthKitSetupAssistant.healthStore.execute(energyQuery)
    }
    
    
    static func getActiveEnergyBurned() -> (Double) {
        return activeEnergyBurnedProfile.activeEnergyBurned ?? 0.0
    }
}
