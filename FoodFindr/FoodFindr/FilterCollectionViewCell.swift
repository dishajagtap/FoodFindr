//
//  FilterCollectionViewCell.swift
//  FoodFindr
//
//  Created by Sanchit Sinha on 3/16/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import UIKit
import SwiftyJSON

class FilterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var filterButton: UIButton!
    weak var apiCallerVal: RecipeAPICaller!
    var filterVal: String!
    weak var tableVal: UITableView!
    weak var mealVal: MealsViewController!
    func setButton(filterTup: (String, String), apiCaller: RecipeAPICaller, table: UITableView, meal: MealsViewController) {
        tableVal = table
        apiCallerVal = apiCaller
        mealVal = meal
        filterVal = filterTup.1
        filterButton.setTitle(filterTup.0, for: UIControl.State.normal)
        filterButton.backgroundColor = UIColor.white
        filterButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    @objc func buttonAction(sender: UIButton!) {
        if sender.backgroundColor == UIColor.white {
            sender.backgroundColor = UIColor.orange
            apiCallerVal.addFilter(filter: filterVal)
        } else {
            sender.backgroundColor = UIColor.white
            apiCallerVal.removeFilter(filter: filterVal)
        }
        apiCallerVal.getRecipes().responseJSON{ response in
            self.mealVal.activityIndicator.startAnimating()
            let json = JSON(response.result.value as Any)
            let hits = json["hits"]
            self.mealVal.recipes = []
            for h in hits {
                self.mealVal.recipes.append(Recipe(hitJson: h.1))
            }
            self.tableVal.reloadData()
            self.mealVal.activityIndicator.stopAnimating()
        }
    }
}

