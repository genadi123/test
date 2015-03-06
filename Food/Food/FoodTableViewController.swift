//
//  FoodTableViewController.swift
//  Food
//
//  Created by robert on 2/27/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import UIKit
import CoreData

class FoodTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    
//    var foodNames = ["puri", "yveli"]
//    var foodImages = ["puri.jpg","yveli.jpg"]
//    var foods : [Food] = [Food(name: "puri", image: "puri.jpg"), Food(name: "yveli", image: "yveli.jpg")]
    var foods : [FoodEntity] = []
    var fetchResultController:NSFetchedResultsController!
    
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Retrieve content from Food store
        var fetchRequest = NSFetchRequest(entityName: "FoodEntity")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext {
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            var e: NSError?
            var result = fetchResultController.performFetch(&e)
            foods = fetchResultController.fetchedObjects as [FoodEntity]
            
            if result != true {
                println(e?.localizedDescription)
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.foods.count
       //return self.foodNames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
            let cellIdentifier = "Cell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath:
                indexPath) as CustomTableViewCell  //UITableViewCell
            // Configure the cell...
            let food = foods[indexPath.row]
            
            cell.nameLabel.text = food.name
            cell.locationLabel.text = food.location
            cell.cellImageView?.image = UIImage(data: food.image)
            
            //cell.cellImageView?.image = UIImage(named: food.image)
            
//            cell.textLabel?.text = foodNames[indexPath.row]
//            cell.imageView?.image = UIImage(named: foodImages[indexPath.row])
            
//            cell.nameLabel.text = foodNames[indexPath.row]
//            cell.cellImageView?.image = UIImage(named: foodImages[indexPath.row])

            // Circular image
            
            //cell.cellImageView.layer.cornerRadius = cell.cellImageView.frame.size.width / 2
            cell.cellImageView.layer.cornerRadius = 8.0
            cell.cellImageView.clipsToBounds = true
            return cell
    }

//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:
//        NSIndexPath) {
//            // Create an option menu as an action sheet
//            let optionMenu = UIAlertController(title: nil, message: "?",
//                preferredStyle: .ActionSheet)
//            // Add actions to the menu
//            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//            optionMenu.addAction(cancelAction)
//            // Display the menu
//            self.presentViewController(optionMenu, animated: true, completion: nil)
//            
//            let callActionHandler = { (action:UIAlertAction!) -> Void in
//                let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
//                alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//                self.presentViewController(alertMessage, animated: true, completion: nil)
//            }
//            
//            let callAction = UIAlertAction(title: "Call " + "599-232-32\(indexPath.row)", style:
//                UIAlertActionStyle.Default, handler: callActionHandler)
//            
//            let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default, handler: {
//                (action:UIAlertAction!) -> Void in
//                let cell = tableView.cellForRowAtIndexPath(indexPath)
//                cell?.accessoryType = .Checkmark
//            })
//            
//            optionMenu.addAction(callAction)
//    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle:
        UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            
//            if editingStyle == .Delete {
//                // Delete the row from the data source
//                
//                self.foods.removeAtIndex(indexPath.row)
////                self.foodNames.removeAtIndex(indexPath.row)
////                self.foodImages.removeAtIndex(indexPath.row)
//             
//                //self.tableView.reloadData()
//                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//            }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        var deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete",handler: {
            (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            // Delete the row from the data source
            if let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext {
                
                let foodToDelete = self.fetchResultController.objectAtIndexPath(indexPath) as FoodEntity
                managedObjectContext.deleteObject(foodToDelete)
                
                var e: NSError?
                if managedObjectContext.save(&e) != true {
                    println("delete error: \(e!.localizedDescription)")
                }
            }
            
        })
        
        return [deleteAction]
    }
    
    func controllerWillChangeContent(controller: NSFetchedResultsController!) {
        tableView.beginUpdates()
    }
    func controller(controller: NSFetchedResultsController!, didChangeObject anObject: AnyObject!,
        atIndexPath indexPath: NSIndexPath!, forChangeType type: NSFetchedResultsChangeType,
        newIndexPath: NSIndexPath!) {
            switch type {
            case .Insert:
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
            case .Delete:
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            case .Update:
                tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            default:
                tableView.reloadData()
            }
            foods = controller.fetchedObjects as [FoodEntity]
    }
    func controllerDidChangeContent(controller: NSFetchedResultsController!) {
        tableView.endUpdates()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showFoodDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as DetailViewController
                destinationController.food = foods[indexPath.row]
                
                //                destinationController.foodImage = self.foods[indexPath.row].image
                //                destinationController.foodName = self.foods[indexPath.row].name
                
                //                destinationController.foodImage = self.foodImages[indexPath.row]
                //                destinationController.foodName = self.foodNames[indexPath.row]
            }
        }
    }

    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
