//
//  TableViewController.swift
//  ImaginaryAnimalsLister
//
//  Created by Irene Chen on 9/14/15.
//  Copyright © 2015 MathNotRequired. All rights reserved.
//

import UIKit

struct MyAnimalsLoader: AnimalsLoader {
    var url:NSURL? = NSURL(string: "http://charliewilliams.org/SwiftBootcamp/Animals.json")
}

class TableViewController: UITableViewController {

    var animalsArray:[ImaginaryAnimal]
    
    required init?(coder aDecoder: NSCoder){ //a failable initializer, because our super init is optional.

        animalsArray = MyAnimalsLoader().loadAnimals()
        super.init(coder: aDecoder)
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animalsArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
//this is where we get the cell to display. Called once for every cell in the table view (animalsArray.count in our case)
        // Configure the cell...
        
        let animal = animalsArray[indexPath.row]
        
        cell.textLabel?.text = "\(indexPath.row + 1). \(animal.name)" //the textLabel is optional, bails if it's nil, in a safe way

        return cell
    }


       // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destinationViewController = segue.destinationViewController as? DetailViewController, let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
            //as? = if it is a class, DetailViewController, then go do stuff in the if statement.
            let selectedAnimal = animalsArray[selectedIndex]
            destinationViewController.animal = selectedAnimal
        }
    }

}
