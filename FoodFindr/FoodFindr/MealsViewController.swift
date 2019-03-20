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
    var url: String
    init(hitJson: JSON) {
        let recipe = hitJson["recipe"]
        self.uri = recipe["uri"].string!
        self.label = recipe["label"].string!
        self.imageUrl = recipe["image"].string!
        self.calories = recipe["calories"].int!
        self.url = recipe["url"].string!
    }
}

class MealsViewController: UIViewController {
    var currentCalories:Double = 0.0
    @IBOutlet weak var recipeTableView: UITableView!
    let apiCaller = RecipeAPICaller()
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    var filters: [(String, String)] = [
        ("Balanced", RecipeAPICaller.balanced),
        ("High-protein", RecipeAPICaller.high_protein),
        ("Low-fat", RecipeAPICaller.low_fat),
        ("Low-carb", RecipeAPICaller.low_carb),
        ("Vegan", RecipeAPICaller.vegan),
        ("Vegetarian", RecipeAPICaller.vegetarian),
        ("Sugar-conscience", RecipeAPICaller.sugar_conscience),
        ("Peanut-free", RecipeAPICaller.peanut_free),
        ("Tree-free", RecipeAPICaller.tree_free),
        ("Alcohol-free", RecipeAPICaller.alcohol_free)
    ]
    var recipes: [Recipe] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        

        self.recipeTableView.separatorStyle = .none

        self.navigationItem.title = "Meals"

        // Do any additional setup after loading the view.
        print("Getting recipes...")
        apiCaller.getRecipes().responseJSON{ response in
            self.activityIndicator.startAnimating()
            let json = JSON(response.result.value)
            let hits = json["hits"]
            for h in hits {
                self.recipes.append(Recipe(hitJson: h.1))
            }
            self.recipeTableView.reloadData()
            self.activityIndicator.stopAnimating()
        }

    }

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        currentCalories = Double(recipes[indexPath.row].calories)
        print("Recipe Calories: \(recipes[indexPath.row].calories)")
        print("Current Calories: \(currentCalories)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeCell
        if let url = URL(string: cell.recipeVal.url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}

extension MealsViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCollectionViewCell", for: indexPath) as! FilterCollectionViewCell
        cell.setButton(filterTup: filters[indexPath.row], apiCaller: self.apiCaller, table: self.recipeTableView, meal: self)
        return cell
    }
}
