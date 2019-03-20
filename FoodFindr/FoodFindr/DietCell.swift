//
//  DietCell.swift
//  FoodFindr
//
//  Created by Disha Jagtap on 3/19/19.
//  Copyright © 2019 Disha Jagtap. All rights reserved.
//

class DietCell: UITableViewCell {
    
    @IBOutlet weak var dietLabel: UILabel!
    @IBOutlet weak var checkmarkBox: UIImageView!
    func setCell(dietLabel: String?, showCheckmarkBox: Bool) {
        self.dietLabel.text = dietLabel
        self.checkmarkBox.isHidden = !showCheckmarkBox
    }
    func showCheckmarkBox() {
        self.checkmarkBox.isHidden = false
    }
    func hideCheckmarkBox() {
        self.checkmarkBox.isHidden = true
    }
}
