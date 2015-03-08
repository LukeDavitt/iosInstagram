//
//  ViewController.swift
//  Instagram
//
//  Created by Luke Davitt on 3/2/15.
//  Copyright (c) 2015 Luke Davitt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var signUpActive = true
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var formLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registeredLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    func displayAlert(title:String, error:String){
        
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: {
            action in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func signUp(sender: AnyObject) {
        var error = ""
        
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0,50,50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        if signUpActive == true{
            
            var user = PFUser()
            user.username = username.text
            user.password = password.text
            
            if username.text == "" || password.text == "" {
                
                error = "Please enter a username and password"
                
            } else {
                
                user.signUpInBackgroundWithBlock{
                    (succeeded: Bool!, signupError: NSError!) -> Void in
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
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
        
        }else{
            
            PFUser.logInWithUsernameInBackground(username.text, password:password.text) {
                (user: PFUser!, error: NSError!) -> Void in
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if user != nil {
                    // Yes, User Exists
                    println("logged in")
                } else {
                    // No, User Doesn't Exist
                    println("there was an error")
                }
            }
            
            
        }
        
        if error != ""{
            displayAlert("Error in Form", error: error)
        }
    }
    
    @IBAction func switchActive(sender: AnyObject) {
        let login = ["Use the form below to Login", "Sign Up","Not Registered?", "Log In"]
        let signUp = ["Use the form below to Sign Up", "Log In", "Already Registered?", "Sign Up"]
        var text = []
        println("im kinda working")
        if signUpActive == true{
            
            signUpActive = false

            text = login
            
        }else{
            
            signUpActive = true
            
            text = signUp
        }
        
        formLabel.text = text[0] as? String
        loginButton.setTitle(text[1] as? String, forState: .Normal)
        registeredLabel.text = text[2] as? String
        signUpButton.setTitle(text[3] as? String, forState: .Normal)
    
    }
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

