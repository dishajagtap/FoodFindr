//
//  WorkoutsViewController.swift
//  FoodFindr
//
//  Created by Disha Jagtap on 1/17/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import UIKit
import HealthKit

class WorkoutsViewController: UIViewController {
    // var currentCaloriesAfterSelectingFood:Double = MealsViewController().currentCalories

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Home"
        setUpUI()
        healthKitSetup()
        fetchAndUpdateAEB()
        setUpBackgroundDeliveryForAEB()
        BMRValue.text = "\(UserHealthProfile.basalMetabolicRate)"
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    func setUpUI() {
        let date = Date()
        let calendar = Calendar.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "EEEE"
        let dayOfWeek = dateFormatter.string(from:date)
        
        dateMonth.text = "\(nameOfMonth)"
        dateDay.text = "\(calendar.component(.day, from: date))"
        dateDOTW.text = "\(dayOfWeek)"
        
        if UserHealthProfile.biologicalSex?.rawValue == 1 {
            profilePicture.image = UIImage(named: "Profile Female")
        } else {
            profilePicture.image = UIImage(named: "Profile Male")
        }
        
    }

    func healthKitSetup() {
        HealthKitSetupAssistant.authorizeHealthKit()
    }

    func fetchAndUpdateAEB() {
        ActiveEnergyBurnedDataStore.fetchActiveEnergyBurned()
        updateAEBLabel()
    }

    func updateAEBLabel() {
        DispatchQueue.main.async {
            let activeEnergyBurned = ActiveEnergyBurnedDataStore.getActiveEnergyBurned()
            self.caloriesBurnedValue.text = "\(activeEnergyBurned) kCal"
        }
    }

    func setUpBackgroundDeliveryForAEB() {
        let sampleType = HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!
        let query = HKObserverQuery(sampleType: sampleType, predicate: nil) {
            (query, completionHandler, error) in
            debugPrint("observer query update handler called for type \(sampleType)")
            completionHandler()
            self.fetchAndUpdateAEB()
        }
        HealthKitSetupAssistant.healthStore.execute(query)
        HealthKitSetupAssistant.healthStore.enableBackgroundDelivery(for: sampleType, frequency: .immediate) { (complete, error) in
            debugPrint("enableBackgroundDeliveryForType handler called for \(sampleType) - success: \(complete)")
        }
    }

    @IBOutlet public weak var caloriesBurnedLabel: UILabel!
    @IBOutlet public weak var caloriesBurnedValue: UILabel!
    @IBOutlet weak var dateMonth: UILabel!
    @IBOutlet weak var dateDay: UILabel!
    @IBOutlet weak var dateDOTW: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var BMRValue: UILabel!
    let activeEnergy = ActiveEnergyBurnedDataStore.getActiveEnergyBurned()

}
