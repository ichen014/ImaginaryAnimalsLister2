//
//  CameraViewController.swift
//  ImaginaryAnimalsLister
//
//  Created by Brian Freese on 9/17/15.
//  Copyright © 2015 MathNotRequired. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func captureButtonPressed(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .Camera
            imagePickerController.allowsEditing = false
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    //    @IBOutlet weak var resetButtonPressed: UIButton!
    @IBAction func resetButtonPressed(sender: UIButton) {
        self.imageView.hidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        //
        self.dismissViewControllerAnimated(true) { () -> Void in
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.imageView.alpha = 1.0
            })
        }
        self.imageView.hidden = false
        self.imageView.image = image
        self.imageView.alpha = 0.2
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}