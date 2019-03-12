//
//  UserHealthProfile.swift
//  FoodFindr
//
//  Created by Disha Jagtap on 3/11/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//
import HealthKit

class UserHealthProfile {
    
    var age: Int?
    var biologicalSex: HKBiologicalSex?
    var height: Double?
    var currentWeight: Double?
    var bodyMassIndex: Double? {
        guard let currentWeight = currentWeight,
            let height = height,
            height > 0 else {
                return nil
        }
        return (currentWeight/(height*height))
    }
}
