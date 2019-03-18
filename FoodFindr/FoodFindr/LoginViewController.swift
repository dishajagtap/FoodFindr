//
//  LoginViewController.swift
//  testingSignIn
//
//  Created by Tania Yap on 3/9/19.
//  Copyright © 2019 Tania Yap. All rights reserved.
//

import UIKit
import GoogleSignIn

// [START viewcontroller_interfaces]
class LoginViewController: UIViewController, GIDSignInUIDelegate {
    // [END viewcontroller_interfaces]
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var signOutButton: UIButton!
    
    
    @IBOutlet weak var titleLogin: UILabel!
    // [START viewdidload]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "AppThemeColor")
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        // TODO(developer) Configure the sign-in button look/feel
        // [START_EXCLUDE]
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(LoginViewController.receiveToggleAuthUINotification(_:)),
                                               name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
                                               object: nil)
        toggleAuthUI()
        // [END_EXCLUDE]
    }
    // [END viewdidload]
    
    // [START signout_tapped]
    @IBAction func didTapSignOut(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        // [START_EXCLUDE silent]
        toggleAuthUI()
        // [END_EXCLUDE]
    }
    // [END signout_tapped]
    
    // [START toggle_auth]
    func toggleAuthUI() {
        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            // Signed in
            signInButton.isHidden = true
            signOutButton.isHidden = false
            // disconnectButton.isHidden = false
        } else {
            signInButton.isHidden = false
            signOutButton.isHidden = true
            // disconnectButton.isHidden = true
        }
    }
    // [END toggle_auth]
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
                                                  object: nil)
    }
    
    @objc func receiveToggleAuthUINotification(_ notification: NSNotification) {
        if notification.name.rawValue == "ToggleAuthUINotification" {
            self.toggleAuthUI()
        }
    }
}

