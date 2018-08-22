//
//  UserViewController.swift
//  Amity Hall
//
//  Created by Nel Toms on 8/5/18.
//  Copyright © 2018 Parko Inc. All rights reserved.
//

import UIKit
import Firebase

class UserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutButtonTapped(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }
        catch {
            print("error, there was a problem signing out.")
        }
        
        
        
        
        
        
        
//        UserDefaults.standard.removeObject(forKey: "user_name")
//        UserDefaults.standard.synchronize()
//
//        PFUser.logOutInBackground()
//
//        // Navigat to Protected page
//        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//
//        var signInPage:LoginViewController = mainStoryBoard.instantiateInitialViewController() as! LoginViewController
//
//        var signInPageNav = UINavigationController(rootViewController: signInPage)
//
//        var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        appDelegate.window?.rootViewController = signInPageNav
    }
    
  
}
