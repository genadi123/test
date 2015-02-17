//
//  Photo.swift
//  Photos
//
//  Created by robert on 2/14/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

//import Foundation

//class Photo {
//    var name:String = ""
//    var time:String = ""
//    var location:String = ""
//    var image:String = ""
//    
//    init(name:String, time:String, location:String, image:String) {
//        self.name = name
//        self.time = time
//        self.location = location
//        self.image = image
//    }
//}
import Foundation
import CoreData

class Photo : NSManagedObject {
    @NSManaged var name:String!
    @NSManaged var time:String!
    @NSManaged var location:String!
    @NSManaged var image:NSData!
    
}