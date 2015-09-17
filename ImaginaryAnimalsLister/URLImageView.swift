//
//  URLImageView.swift
//  ImaginaryAnimalsLister
//
//  Created by Brian Freese on 9/17/15.
//  Copyright © 2015 MathNotRequired. All rights reserved.
//

import UIKit

class LoadingImageOperation : NSOperation
    
{
    var animal : ImaginaryAnimal?
    var animalImageView : URLImageView?
    var url : NSURL?
    
    init(imaginaryAnimal: ImaginaryAnimal, animalImageView: URLImageView)
    {
        self.animal = imaginaryAnimal
        self.animalImageView = animalImageView
        
    }
    
    init(url: NSURL) {
        self.url = url
        super.init()
        self.qualityOfService = .UserInitiated
    }
    
    override func main() {
        if let url = self.animal?.imageURL,
            let imageData = NSData(contentsOfURL: url) {
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    self.animalImageView?.image = UIImage(data: imageData)
                }
        }
        if let url = self.url,
            let imageData = NSData(contentsOfURL: url) {
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    self.animalImageView?.image = UIImage(data: imageData)
                })
        }
    }
}

class URLImageView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    var url:NSURL? {
        didSet {
            if let url = self.url {
                let loadOp = LoadingImageOperation(url: url)
                loadOp.animalImageView = self
                NSOperationQueue().addOperation(loadOp)
            }
        }
    }

}
