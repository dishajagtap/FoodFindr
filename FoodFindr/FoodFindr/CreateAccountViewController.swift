//
//  CreateAccountViewController.swift
//  FoodFindr
//
//  Created by Yohana Yap on 3/2/19.

import UIKit

class CreateAccountViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Properties

    @IBOutlet weak var createAccountTitle: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: Actions
    @IBAction func moveToEnterUserDataSceneButton(_ sender: UIButton) {
    }
}
