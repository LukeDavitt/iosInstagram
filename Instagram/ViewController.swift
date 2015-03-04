//
//  ViewController.swift
//  Instagram
//
//  Created by Luke Davitt on 3/2/15.
//  Copyright (c) 2015 Luke Davitt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    func displayAlert(title:String, error:String){
        
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: {
            action in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func signUp(sender: AnyObject) {
        
        var error = ""
        
        if username.text == "" || password.text == "" {
            
            error = "Please enter a username and password"
            
        } else {
            
            var user = PFUser()
            user.username = username.text
            user.password = password.text
            
            
            user.signUpInBackgroundWithBlock{
                (succeeded: Bool!, signupError: NSError!) -> Void in
                if signupError == nil{
                    
                } else {
                    if let errorString = signupError.userInfo?["error"] as? NSString{
                        error = errorString
                    } else {
                        error = "Please try again later."
                    }
                    
                    self.displayAlert("Could Not Sign Up", error: error)
                }
            }
            
        }
        
        if error != ""{
            displayAlert("Error in Form", error: error)
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

