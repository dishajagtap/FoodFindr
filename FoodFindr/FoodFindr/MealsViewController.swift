//
//  MealsViewController.swift
//  FoodFindr
//
//  Created by Disha Jagtap on 1/18/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import UIKit
import SwiftyJSON

class Recipe {
    var uri: String
    var label: String
    var imageUrl: String
    var calories: Int
    init(hitJson: JSON) {
        let recipe = hitJson["recipe"]
        self.uri = recipe["uri"].string!
        self.label = recipe["label"].string!
        self.imageUrl = recipe["image"].string!
        self.calories = recipe["calories"].int!
    }
}

class MealsViewController: UIViewController {
    @IBOutlet weak var recipeTableView: UITableView!
    
    var recipes: [Recipe] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Path loading...")
        // Do any additional setup after loading the view.
        guard let path = Bundle.main.path(forResource: "recipe_out_example", ofType: "json") else {
            print("Failed")
            return
            
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let json = JSON(data)
            let hits = json["hits"]
            for h in hits {
                recipes.append(Recipe(hitJson: h.1))
            }
        }
        catch {
            print(error)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MealsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeCell
        let recipe = recipes[indexPath.row]
        cell.setCell(recipe: recipe)
        return cell
    }
}
