//
//  ViewController.swift
//  core data simple example
//
//  Created by robert on 2/10/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//
import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource{
    
    //var names = [String]()
    var people = [NSManagedObject]()
    var fetch = false
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addName(sender: AnyObject) {
        if textField.text != ""{
            //self.names.append(textField.text)
            self.saveName(textField.text)
            textField.text = ""
            
        }
        self.tableView.reloadData()
    }
    @IBAction func cencelName(sender: AnyObject) {
        textField.text = ""
    }
    
    @IBAction func dataFromMemory(sender: AnyObject) {
        //
        getData()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return names.count
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        //cell.textLabel!.text = names[indexPath.row]
        
        var person = people[indexPath.row]
        
        cell.textLabel!.text = person.valueForKey("name") as String?
        return cell
    }
    
    func saveName(name : String){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        person.setValue(name, forKey: "name")
        var error : NSError?
        if !managedContext.save(&error){
            println("Could not save \(error), \(error?.userInfo)")
        }
        people.append(person)
    }
   func getData() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName:"Person")
        
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        
        if let results = fetchedResults {
            people = results
            //people += results
            //for i in results{
                //people.append(i)
            //}
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
}


