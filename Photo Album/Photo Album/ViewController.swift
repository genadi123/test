//
//  ViewController.swift
//  Photo Album
//
//  Created by robert on 2/12/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    var managedContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Insert data
    func insertData() {
        
        //let fetchRequest = NSFetchRequest(entityName:"PhotoAntity")
        //fetchRequest.predicate = NSPredicate(format: "searchKey != nil")
        
        //let count = managedContext.countForFetchRequest(fetchRequest, error: nil);
        //if count > 0 { return }
        
        //let path = NSBundle.mainBundle().pathForResource("SampleData", ofType: "plist")
        //let dataArray = NSArray(contentsOfFile: path!)!
        
        //for dict : AnyObject in dataArray {
            
            let entity = NSEntityDescription.entityForName("PhotoAntity", inManagedObjectContext: managedContext)
            let photoAntity = PhotoAntity(entity: entity!, insertIntoManagedObjectContext: managedContext)
            let btDict = dict as NSDictionary
            //bowtie.name = btDict["name"] as NSString
            //bowtie.searchKey = btDict["searchKey"] as NSString
            //bowtie.rating = btDict["rating"] as NSNumber
            //let tintColorDict = btDict["tintColor"] as NSDictionary
            //bowtie.tintColor = colorFromDict(tintColorDict)
            //let imageName = btDict["imageName"] as NSString
            //let image = UIImage(named:imageName)
            //let photoData = UIImagePNGRepresentation(image)
            //bowtie.photoData = photoData
            //bowtie.lastWorn = btDict["lastWorn"] as NSDate
            //bowtie.timesWorn = btDict["timesWorn"] as NSNumber
            //bowtie.isFavorite = btDict["isFavorite"] as NSNumber
       //}
    }
}

