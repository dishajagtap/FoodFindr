//
//  FilterCollectionViewCell.swift
//  FoodFindr
//
//  Created by Sanchit Sinha on 3/16/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var filterButton: UIButton!
    func setText(text: String) {
        filterButton.setTitle(text, for: UIControl.State.normal)
    }
}
