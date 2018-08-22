//
//  CreateIdViewController.swift
//  Amity Hall
//
//  Created by Nel Toms on 8/9/18.
//  Copyright © 2018 Parko Inc. All rights reserved.
//

import UIKit
import Firebase

class CreateIdViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var userEmailAddressTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userPasswordRepeatTextField: UITextField!
    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @objc func tableViewTapped(){
        userEmailAddressTextField.endEditing(true)
        userPasswordTextField.endEditing(true)
        userPasswordRepeatTextField.endEditing(true)
        userFirstNameTextField.endEditing(true)
        userLastNameTextField.endEditing(true)
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
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        // Create Activity Indicator
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        
        // Position AI in the center of the main view
        myActivityIndicator.center = view.center
        
        myActivityIndicator.hidesWhenStopped = true
        
        myActivityIndicator.startAnimating()
        
        view.addSubview(myActivityIndicator)
    
        
        let userName = userEmailAddressTextField.text
        let userPassword = userPasswordTextField.text
        let userPasswordRepeat = userPasswordRepeatTextField.text
        let userFirstName = userFirstNameTextField.text
        let userLastName = userLastNameTextField.text
        
        if ((userName!.isEmpty) || (userPassword!.isEmpty) || (userPasswordRepeat?.isEmpty)! || (userFirstName?.isEmpty)! || (userLastName?.isEmpty)!) {
            var myAlert = UIAlertController(title: "Alert", message: "All fields must have a value", preferredStyle:UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
            self.removeActivityIndicator(activityIndicator: myActivityIndicator)
        }
        else if(userPassword != userPasswordRepeat){
            var myAlert = UIAlertController(title: "Alert", message: "Passwords do not match. Please try again.", preferredStyle:UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
            self.removeActivityIndicator(activityIndicator: myActivityIndicator)

        } else {
            Auth.auth().createUser(withEmail: userName!, password: userPassword!) { (user, error) in
                
                if error != nil {
                    print(error!)
                } else {
                    print("Registration is complete!")
                    self.performSegue(withIdentifier: "goToMain", sender: self)
                    self.removeActivityIndicator(activityIndicator: myActivityIndicator)
                
                }
            }
            
        }
        
        
        
        
        
        
        
//        let myUser : PFUser = PFUser()
//        myUser.username = userName
//        myUser.password = userPassword
//        myUser.email = userName
//        myUser.setObject(userFirstName!, forKey: "first_name")
//        myUser.setObject(userLastName!, forKey: "last_name")
//
//        let profileImageData = UIImageJPEGRepresentation(profilePhotoImageView.image!, 1)
//        if(profileImageData != nil){
//            _ = PFFile(data: profileImageData!)
//            myUser.setObject(profileImageData!, forKey: "profile_picture")
//        }
//
//        myUser.signUpInBackground { (success, error) in
//
//            var userMessage = "Registaration is successful. Thank you!"
//            if(!success) {
//                //userMessage = "Could not register at this time. Please try again later"
//                userMessage = error!.localizedDescription
//            }
//
//            var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle:UIAlertControllerStyle.alert)
//
//            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){ action in
//
//                if(success) {
//                    self.dismiss(animated: true, completion: nil)
//                }
//            }
//            myAlert.addAction(okAction)
//
//            self.present(myAlert, animated: true, completion: nil)
//
//            self.removeActivityIndicator(activityIndicator: myActivityIndicator)
//        }
        
    }
    
    @IBAction func selectProfilePhotoButtonTapped(_ sender: Any) {
        var myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    func removeActivityIndicator(activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        profilePhotoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    
    }
    
        func textFieldDidEndEditing(_ textField: UITextField) {
            self.view.layoutIfNeeded()
        }

}
