//
//  CreateIdViewController.swift
//  Amity Hall
//
//  Created by Nel Toms on 8/9/18.
//  Copyright © 2018 Parko Inc. All rights reserved.
//

import UIKit

class CreateIdViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var userEmailAddressTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userPasswordRepeatTextField: UITextField!
    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
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
            
            return
            
        }
        if(userPassword != userPasswordRepeat){
            var myAlert = UIAlertController(title: "Alert", message: "Passwords do not match. Please try again.", preferredStyle:UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
            
            return
        }
        
        let profileImageData = UIImageJPEGRepresentation(profilePhotoImageView.image!, 1)
        if(profileImageData != nil){
            // Create PFFile object to be sent to Parse server
        }
    }
    
    @IBAction func selectProfilePhotoButtonTapped(_ sender: Any) {
        var myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        profilePhotoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
