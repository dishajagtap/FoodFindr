//
//  LoginViewController.swift
//  testingSignIn
//
//  Created by Tania Yap on 3/9/19.
//  Copyright © 2019 Tania Yap. All rights reserved.
//

import UIKit

import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            self.performSegue(withIdentifier: Constants.Segues.SignInToFp, sender: nil)
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            print("USER: \(email)")
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    var handle: AuthStateDidChangeListenerHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()!.options.clientID
        GIDSignIn.sharedInstance().clientID = "514033556508-bffkdjj8o4i1vdl50j6gmigul5im2gv7.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
    }
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
        -> Bool {
            return self.application(application, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: "")
    }
    
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication, annotation: annotation)
    }
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBAction func googleBtnTapped(_ sender: GIDSignInButton) {
        GIDSignIn.sharedInstance().signIn()
        
    }
    

