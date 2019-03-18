//
//  UserHealthProfile.swift
//  FoodFindr
//
//  Created by Disha Jagtap on 3/11/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//
import HealthKit

class UserHealthProfile {
    
    static let inactiveMultiplier = 13
    static let modActiveMultiplier = 15
    static let activeMultiplier = 18
    
    static var age: Int?
    static var biologicalSex: HKBiologicalSex?
    static var height: Double?
    static var currentWeight: Double?
    static var desiredWeight: Double?
    static var activeLifestyle: Int?
    static var fitnessGoal: String?
    static var bodyMassIndex: Double? {
        guard let currentWeight = UserHealthProfile.currentWeight,
            let height = UserHealthProfile.height,
            height > 0 else {
                return nil
        }
        let x = 703*currentWeight/(height*height)
        return Double(floor(x))
    }

}
