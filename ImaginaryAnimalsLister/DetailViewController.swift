//
//  DetailViewController.swift
//  ImaginaryAnimalsLister
//
//  Created by Irene Chen on 9/14/15.
//  Copyright © 2015 MathNotRequired. All rights reserved.
//

import UIKit

class LoadingImageOperation : NSOperation

{
    var animal : ImaginaryAnimal?
    var animalImageView : UIImageView
    
    init(imaginaryAnimal: ImaginaryAnimal, animalImageView: UIImageView)
    {
        self.animal = imaginaryAnimal
        self.animalImageView = animalImageView
        
    }
    
    override func main() {
        if let url = self.animal?.imageURL,
            let imageData = NSData(contentsOfURL: url) {
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    self.animalImageView.image = UIImage(data: imageData)
                }
        }
    }
}

class DetailViewController: UIViewController {

    var animal: ImaginaryAnimal?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLastSeenLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let url = animal?.imageURL,
//            let imageData = NSData(contentsOfURL: url) {
//                self.imageView.image = UIImage(data: imageData)
//        }
        nameLabel.text = "Name: \(animal!.name)"
        heightLabel.text = "Height: \(String(animal!.height))"
        locationLabel.text = "Location: \(animal!.location)"
        dateLastSeenLabel.text = "Date last seen: \(animal!.dateLastSeen)"
        
        loadImage()
    }
    
   func loadImage() {
    
//    let loadingBlock = NSBlockOperation()
//    loadingBlock.qualityOfService = NSQualityOfService.UserInitiated
    let queue = NSOperationQueue()
    let operation = NSBlockOperation { ()
//    NSOperationQueue().addOperation(loadingBlock) { ()
        -> Void in

        //is faster loading the image here? Vs up there ^
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { ()
//            -> Void in
            if let url = self.animal?.imageURL,
                let imageData = NSData(contentsOfURL: url) {
                    NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
                        self.imageView.image = UIImage(data: imageData)
                    }
            }
        }
    operation.qualityOfService = NSQualityOfService.UserInitiated
    queue.addOperation(operation)
    }
}
