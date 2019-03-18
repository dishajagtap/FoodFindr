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

<<<<<<< HEAD
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
=======
// [START viewcontroller_interfaces]
class LoginViewController: UIViewController, GIDSignInUIDelegate {
    // [END viewcontroller_interfaces]
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var signOutButton: UIButton!
    
>>>>>>> fc42a4b358d6848ef973569fa98e87024a6ec0e7
    
    var handle: AuthStateDidChangeListenerHandle?
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
/*
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize sign-in
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().clientID = "514033556508-bffkdjj8o4i1vdl50j6gmigul5im2gv7.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
 */
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
=======
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "AppThemeColor")
>>>>>>> Stashed changes
=======
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "AppThemeColor")
>>>>>>> Stashed changes
=======
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "AppThemeColor")
>>>>>>> Stashed changes
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
=======
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
>>>>>>> fc42a4b358d6848ef973569fa98e87024a6ec0e7
    }
    
<<<<<<< HEAD
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication, annotation: annotation)
<<<<<<< Updated upstream
    }
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBAction func googleBtnTapped(_ sender: GIDSignInButton) {
        GIDSignIn.sharedInstance().signIn()

    }
  
    /*
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let authentication = user.authentication {
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
                
            Auth.auth().signInAndRetrieveData(with: credential, completion: { (user, error) -> Void in
                if error != nil {
                } else if error == nil {
                    print("signed in")
                    self.performSegue(withIdentifier: Constants.Segues.SignInToFp, sender: nil)
                }
            })
=======
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
>>>>>>> fc42a4b358d6848ef973569fa98e87024a6ec0e7
        }
    }
    */
}
// GIDSignIn.sharedInstance().signInSilently()

// if GIDSignIn.sharedInstance().hasAuthInKeychain() {
// Signed in
// self.performSegue(withIdentifier: Constants.Segues.SignInToFp, sender: nil)
// }
/*
 handle = Auth.auth().addStateDidChangeListener() { (auth, user) in
 if user != nil {
 MeasurementHelper.sendLoginEvent()
 self.performSegue(withIdentifier: Constants.Segues.SignInToFp, sender: nil)
 }
 
 }
 
 deinit {
 if let handle = handle {
 Auth.auth().removeStateDidChangeListener(handle)
 }
 }
 */
=======
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBAction func googleBtnTapped(_ sender: GIDSignInButton) {
        GIDSignIn.sharedInstance().signIn()
        
    }
    
}
>>>>>>> Stashed changes
=======
=======
    }
<<<<<<< HEAD
>>>>>>> Stashed changes
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBAction func googleBtnTapped(_ sender: GIDSignInButton) {
        GIDSignIn.sharedInstance().signIn()
        
=======
    
    @objc func receiveToggleAuthUINotification(_ notification: NSNotification) {
        if notification.name.rawValue == "ToggleAuthUINotification" {
            self.toggleAuthUI()
        }
>>>>>>> fc42a4b358d6848ef973569fa98e87024a6ec0e7
    }
    
}
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
