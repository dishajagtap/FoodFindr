//
//  LoginViewController.swift
//  FoodFindr
//
//  Created by Yohana Yap on 3/2/19.

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Properties
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!

    
    // MARK: Actions
    /*
     Login Button
     On tap: print username & password
     */
    @IBAction func loginButton(_ sender: UIButton) {
        print(usernameInput.text ?? "Username") // username.text = value entered into username text field
        print(passwordInput.text ?? "Password") // password.text = value entered into password text field
    }
    @IBAction func userNameInput(_ sender: UITextField) {
    }
}

 // MARK: Navigation
 
