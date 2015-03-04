//
//  ViewController.swift
//  Instagram
//
//  Created by Luke Davitt on 3/2/15.
//  Copyright (c) 2015 Luke Davitt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var pickImage: UIButton!
    @IBOutlet weak var pickedImage: UIImageView!
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("image selected")
        self.dismissViewControllerAnimated(true, completion: nil)
        pickedImage.image = image
    }
    
    @IBAction func pickingImage(sender: AnyObject) {
        var image = UIImagePickerController()
        image.delegate = self
        //image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.sourceType = UIImagePickerControllerSourceType.Camera
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*Parse.setApplicationId("DCMJ1Nn0DH04Kr9DxSrhKFvgDJiuzxUqdw7n7TXB", clientKey: "SERzT8gQyFpvPWGbl1Y4nv235Rpz1viq0AgaM6dB")
        
        var score = PFObject(className: "score")
        score.setObject("Rob", forKey:"name")
        score.setObject(5, forKey:"number")
        score.saveInBackgroundWithBlock { (success: Bool!, error: NSError!) -> Void in
            
            if success == true {
                
                println("Score created with ID: \(score.objectId)")
            
            }else{
                
                println(error)
            }
        }*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

