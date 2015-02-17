//
//  PhotoTableViewController.swift
//  Photos
//
//  Created by robert on 2/14/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import UIKit
import CoreData

class PhotoTableViewController: UITableViewController ,NSFetchedResultsControllerDelegate {

    //var photoNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    //var photoImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg","petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg","haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg","grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg","confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
//    var photos:[Photo] = [
//        Photo(name: "Cafe Deadend", time: "Coffee & Tea Shop", location: "Hong Kong",image: "cafedeadend.jpg"),
//        Photo(name: "Homei", time: "Cafe", location: "Hong Kong", image: "homei.jpg"),
//        Photo(name: "Teakha", time: "Tea House", location: "Hong Kong", image:
//            "teakha.jpg"),
//        Photo(name: "Cafe loisl", time: "Austrian / Causual Drink", location: "Hong Kong",
//            image: "cafeloisl.jpg"),
//        Photo(name: "Petite Oyster", time: "French", location: "Hong Kong", image:
//            "petiteoyster.jpg"),
//        Photo(name: "For Kee Restaurant", time: "Bakery", location: "Hong Kong", image:
//            "forkeerestaurant.jpg")]
    
    var photos:[Photo] = []
    var fetchResultController : NSFetchedResultsController!
    
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Retrieve content from persistent store
        var fetchRequest = NSFetchRequest(entityName: "Photo")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext {
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext:managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            var e: NSError?
            var result = fetchResultController.performFetch(&e)
            photos = fetchResultController.fetchedObjects as [Photo]
            
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
        return self.photos.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
            let cellIdentifier = "Cell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath:
                indexPath) as CustomTableViewCell
            
            // Configure the cell...
            let photo = photos[indexPath.row]
            cell.nameLabel.text = photo.name
            //cell.thumbnailImageView.image = UIImage(named: photo.image)
            cell.thumbnailImageView.image = UIImage(data: photo.image)
            cell.locationLabel.text = photo.location
            cell.timeLabel.text = photo.time
            //cell.textLabel?.text = photoNames[indexPath.row]
            //cell.imageView?.image = UIImage(named: photoImages[indexPath.row])
            cell.thumbnailImageView.layer.cornerRadius = 10.0 //cell.thumbnailImageView.frame.size.width / 2
            cell.thumbnailImageView.clipsToBounds = true
            return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showPhotoDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as DetailViewController
                //destinationController.photoImage = self.photos[indexPath.row].image
                
                destinationController.photo = photos[indexPath.row]            }
        }
    }
    
    func controllerWillChangeContent(controller: NSFetchedResultsController!) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController!, didChangeObject anObject: AnyObject!, atIndexPath indexPath: NSIndexPath!, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath!) {
        
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
        
        photos = controller.fetchedObjects as [Photo]
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController!) {
        tableView.endUpdates()
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
