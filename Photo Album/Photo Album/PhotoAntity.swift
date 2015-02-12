//
//  PhotoAntity.swift
//  Photo Album
//
//  Created by robert on 2/12/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import Foundation
import CoreData

class PhotoAntity: NSManagedObject {

    @NSManaged var createDate: NSDate
    @NSManaged var discription: String
    @NSManaged var isFavorite: NSNumber
    @NSManaged var lastSeen: NSDate
    @NSManaged var locationPhotoTaken: String
    @NSManaged var name: String
    @NSManaged var photoData: NSData
    @NSManaged var searchKey: String

}
