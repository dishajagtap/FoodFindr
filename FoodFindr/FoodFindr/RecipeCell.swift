//
//  RecipeCell.swift
//  FoodFindr
//
//  Created by Sanchit Sinha on 3/14/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    func setCell(recipe: Recipe) {
        recipeLabel.text = recipe.label
        calorieLabel.text = "\(recipe.calories) cal"
        do {
            let url = URL(string: recipe.imageUrl)!
            let data = try Data(contentsOf: url)
            self.recipeImage.image = UIImage(data: data)
        }
        catch {
            print(error)
        }
    }
}
