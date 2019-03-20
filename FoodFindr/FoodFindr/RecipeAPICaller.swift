//
//  RecipeAPICaller.swift
//  FoodFindr
//
//  Created by Sanchit Sinha on 3/15/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import Foundation
import Alamofire
//import Firebase

class RecipeAPICaller {
    static let app_id = "449267b6"
    static let app_key = "dc3d3484b6a0dad040d224e307b60447"
    let example_link = "https://api.edamam.com/search?app_id="+app_id+"&app_key="+app_key+"&from=0&to=3&calories=591-722&q="
    
    var base_link = ""
    var extra: Set<String>
    init() {
        let app_id = "449267b6"
        let app_key = "dc3d3484b6a0dad040d224e307b60447"
        self.extra = Set<String>()
        base_link = "https://api.edamam.com/search?app_id="+app_id+"&app_key="+app_key+"&from=0&to=5&calories=591-722&q="
    }
    
    static let balanced = "&diet=balanced"
    static let high_protein = "&diet=high-protein"
    static let low_fat = "&diet=low-fat"
    static let low_carb = "&diet=low-carb"
    static let vegan = "&health=vegan"
    static let vegetarian = "&health=vegetarian"
    static let sugar_conscience = "&health=sugar-conscience"
    static let peanut_free = "&health=peanut-free"
    static let tree_free = "&health=tree-nut-free"
    static let alcohol_free = "&health=alcohol-free"
    
    func getRecipes() -> DataRequest {
        var link = base_link
        for e in extra {
            link += e
        }
        print(link)
        return AF.request(link, method: .get)
    }
    
    func addFilter(filter: String) {
        extra.insert(filter)
    }
    
    func removeFilter(filter: String) {
        extra.remove(filter)
    }
    
    func reset() {
        extra.removeAll()
    }
    
    func getExampleRecipe() -> DataRequest {
        return AF.request(example_link, method: .get)
    }
}
