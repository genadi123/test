//
//  DetailViewController.swift
//  Food
//
//  Created by robert on 2/27/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
//    var foodImage : String!
//    var foodName : String!
    var food : FoodEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain,
            target: nil, action: nil)
        //title = self.foodName
        title = self.food.name
        
        // Do any additional setup after loading the view.
        
        self.foodImageView.image = UIImage(data: food.image)
        self.nameLabel.text = food.name
        //        self.foodImageView.image = UIImage(named: foodImage)
        //        self.nameLabel.text = foodName  
        
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "?",
            preferredStyle: .ActionSheet)
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        // Display the menu
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call " + "599-232-327", style:
            UIAlertActionStyle.Default, handler: callActionHandler)
        
//        let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default, handler: {
//            (action:UIAlertAction!) -> Void in
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            cell?.accessoryType = .Checkmark
//        })
        
        optionMenu.addAction(callAction)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(segue:UIStoryboardSegue) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showMap" {
            let destinationController = segue.destinationViewController as MapViewController
            destinationController.food = food
        }
        
    }

}
