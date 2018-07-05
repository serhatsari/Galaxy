//
//  Person+CoreDataProperties.swift
//  MyGalaxyOfAppleSdks
//
//  Created by Serhat Sarı on 5.07.2018.
//  Copyright © 2018 Serabisa. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16

}
