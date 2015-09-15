//
//  AnimalsLoader.swift
//  ImaginaryAnimalsLister
//
//  Created by Irene Chen on 9/14/15.
//  Copyright © 2015 MathNotRequired. All rights reserved.
//

import Foundation

struct AnimalsLoader {
    
    func loadAnimals() -> [ImaginaryAnimal] { //doesn't need the import file. Have to mark as private, or else mostly public.
        
        var animalsArray = [ImaginaryAnimal]()
        
        //the if to prevent nil, guard else, where guard makes sure all are true, bails to else if any are false. An "inverted if", else is always required with that.
        guard let url = NSBundle.mainBundle().URLForResource("Animals", withExtension: "json"),
        let data = NSData(contentsOfURL: url),
            let jsonArray = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0)) as? [AnyObject] else {
//                fatalError("Couldn't load or parse file")
                return animalsArray //Bailing out
        }
                //as? (conditionally casting) of a type of AnyObject.
                //try! (force try) if there's an error, crash.
                //try? Bails if there's an error
                //option click, if it "throws", then need a "try".
                
        if let jsonArray:[AnyObject] = jsonArray {
            for animalJson in jsonArray {
                if let animal = ImaginaryAnimal(fromJSON: animalJson) {
                    animalsArray.append(animal)
                }
            }
            
        }
        return animalsArray
    }
    
}