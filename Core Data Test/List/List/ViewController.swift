//
//  ViewController.swift
//  List
//
//  Created by robert on 2/7/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    //var names = [String]()
    var people = [NSManagedObject]()   /* es aris zombi romelsats sheudzlia miigos nebismieri obieqtis saxe da es aris raime                     monatsemta modelis (bazis) obieqti.represents a single object stored in Core Data—you must use it to create, edit, save and delete from your Core Data persistent store*/
    
    @IBAction func addName(sender: AnyObject) {

        var alert = UIAlertController(title: "New name",
            message: "Add a new name",
            preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
            style: .Default) { (action: UIAlertAction!) -> Void in
                
                let textField = alert.textFields![0] as UITextField
                //self.names.append(textField.text)
                self.saveName(textField.text)
                self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: .Default) { (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "The List"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return names.count
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        //cell.textLabel!.text = names[indexPath.row]
        
        let person = people[indexPath.row]
        cell.textLabel!.text = person.valueForKey("name") as String?
        
        return cell
    }
    
    func saveName (name : String){
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        person.setValue(name, forKey: "name")
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
        people.append(person)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName:"Person")
        
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        
        if let results = fetchedResults {
            people = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

