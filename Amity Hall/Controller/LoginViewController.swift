//
//  LoginViewController.swift
//  Amity Hall
//
//  Created by Nel Toms on 8/5/18.
//  Copyright © 2018 Parko Inc. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @objc func tableViewTapped(){
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tableViewTapped)))
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signInButtonTapped(_ sender: Any) {
        // Create Activity Indicator
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        
        // Position AI in the center of the main view
        myActivityIndicator.center = view.center
        
        myActivityIndicator.hidesWhenStopped = true
        
        myActivityIndicator.startAnimating()
        
        view.addSubview(myActivityIndicator)
        
        let userName = userNameTextField.text
        let userPassword = passwordTextField.text
        
        if (userName?.isEmpty)! || (userPassword?.isEmpty)! {
            print("Username \(String(describing: userName)) or password \(String(describing: userPassword)) is empty")
        
        displayMessage(userMessage: "One of the required fields is missing")
        self.removeActivityIndicator(activityIndicator: myActivityIndicator)
        }
        else{
        
            Auth.auth().signIn(withEmail: userName!, password: userPassword!) { (user, error) in
                
                if error != nil {
                    print(error!)
                    self.removeActivityIndicator(activityIndicator: myActivityIndicator)
                } else {
                    print("Login Successful!")
                    self.performSegue(withIdentifier: "goToMain", sender: self)
                    self.removeActivityIndicator(activityIndicator: myActivityIndicator)
                }
                
            }
        }
        
        
        
//        // Transition to UserViewController
//        let signInViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
//        self.present(signInViewController, animated: true)
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
//        let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateIdViewController") as! CreateIdViewController
//        self.present(signUpViewController, animated: true)
    }
    
    func displayMessage(userMessage:String) -> Void {
    
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){ (action:UIAlertAction!) in
            print("Ok button tapped")
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func removeActivityIndicator(activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
            self.view.layoutIfNeeded()
        }
    
}
    



