//
//  FoodEntity.swift
//  Food
//
//  Created by robert on 2/25/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import Foundation
import CoreData

class FoodEntity: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var isVisited: NSNumber
    @NSManaged var type: String
    @NSManaged var location: String
    @NSManaged var image: NSData

}
