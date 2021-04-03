//
//  City+CoreDataProperties.swift
//  Lab5
//
//  Created by  on 3/5/21.
//  Copyright © 2021 Arizona State University. All rights reserved.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var image: String?
    @NSManaged public var city: String?
    @NSManaged public var desc: String?

}
