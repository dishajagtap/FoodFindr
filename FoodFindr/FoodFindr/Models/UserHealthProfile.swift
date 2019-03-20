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
    static let poundsToKgMultiplier = 0.45359237
    static let inchesToCmMultiplier = 2.54
    
    static var age: Int?
    static var biologicalSex: HKBiologicalSex?
    static var height: Double?
    static var currentWeight: Double?
    static var desiredWeight: Double?
    static var activeLifestyle: String?
    static var fitnessGoal: String? = "Maintain Weight"
    static var bodyMassIndex: Int? {
        guard let currentWeight = UserHealthProfile.currentWeight,
            let height = UserHealthProfile.height,
            height > 0 else {
                return nil
        }
        let x = 703*currentWeight/(height*height)
        return Int(floor(x))
    }
    static var basalMetabolicRate: Double? {
        guard let currentWeight = UserHealthProfile.currentWeight,
            let height = UserHealthProfile.height,
            let age = UserHealthProfile.age,
            height > 0 else {return nil}
        
        var bmr = 0.0
        if (age == 1) {
            let v1 = (9.247 * currentWeight*poundsToKgMultiplier)
            let v2 = (3.098 * height*inchesToCmMultiplier)
            bmr = 447.593 + v1 + v2 - (4.330 * Double(age))
        } else {
            let v1 = (13.397 * currentWeight*poundsToKgMultiplier)
            let v2 = (4.799 * height*inchesToCmMultiplier)
            bmr = 88.362 + v1 + v2 - (5.677 * Double(age))
        }
        return Double(floor(bmr))
    }
    static var dietPreferences: [String] = []
}
