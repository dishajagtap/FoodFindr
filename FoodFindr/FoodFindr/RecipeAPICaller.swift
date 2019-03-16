//
//  RecipeAPICaller.swift
//  FoodFindr
//
//  Created by Sanchit Sinha on 3/15/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import Foundation
import Alamofire

class RecipeAPICaller {
    var example_link = "https://api.edamam.com/search?app_id=ff7726ea&app_key=f563fb2c7043c921bd01d0eeb0312ebd&from=0&to=3&calories=591-722&health=alcohol-free&q=chicken"
    func getExampleRecipe() -> DataRequest {
        return AF.request(example_link, method: .get)
    }
}
