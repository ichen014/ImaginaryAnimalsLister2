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
        
        let dragon = ImaginaryAnimal(name: "Dragon",
            height: 95.5,
            location: "Sky",
            dateLastSeen: "102",
            imageURL: NSURL(string: "https://www.google.com/search?q=dragon&es_sm=119&source=lnms&tbm=isch&sa=X&ved=0CAcQ_AUoAWoVChMIkNjd59n3xwIVx0WICh2gwA6h&biw=1440&bih=714#imgrc=eepcVuvjrnFhLM%3A"))
        
        let smaug = ImaginaryAnimal(name: "Smaug",
            height: 145.5,
            location: "Mines",
            dateLastSeen: "2014",
            imageURL: NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2a/Waterhouse_a_mermaid.jpg"))
        
        let toothless = ImaginaryAnimal(name: "Toothless",
            height: 54.5,
            location: "Berk",
            dateLastSeen: "2013",
            imageURL: NSURL(string: "https://www.google.com/search?q=dragon&es_sm=119&source=lnms&tbm=isch&sa=X&ved=0CAcQ_AUoAWoVChMIkNjd59n3xwIVx0WICh2gwA6h&biw=1440&bih=714#tbm=isch&q=dragon+wiki&imgrc=v5l6YhbnWUuLVM%3A"))

        let snapdragon = ImaginaryAnimal(name: "Snapdragon",
            height: 5.5,
            location: "Phones",
            dateLastSeen: "2015",
            imageURL: NSURL(string: "http://ww1.prweb.com/prfiles/2013/06/28/10873484/close%20up%20flying%20dragon.jpg"))
        
        return [dragon, smaug, toothless, snapdragon]
    }
    
}