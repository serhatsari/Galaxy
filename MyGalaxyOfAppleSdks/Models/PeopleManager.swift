//
//  PeopleManager.swift
//  MyGalaxyOfAppleSdks
//
//  Created by Serhat Sarı on 5.07.2018.
//  Copyright © 2018 Serabisa. All rights reserved.
//

import UIKit
import CoreData

class PeopleManager: NSObject {
    
    private static var peopleManager: PeopleManager = {
        let peopleManager = PeopleManager()
        return peopleManager
    }()
    
    class func shared() -> PeopleManager {
        return peopleManager
    }
    
    func ageOrderedPeople () -> [Person]{
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return []
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<Person>(entityName: "Person")
        
        let sort =
            NSSortDescriptor(key: #keyPath(Person.age), ascending: true)
        
        fetchRequest.sortDescriptors = [sort]
        
        do {
            let people = try managedContext.fetch(fetchRequest)
            return people
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
        
    }
    
    func save(name: String, age:Int16) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "Person",
                                       in: managedContext)!
        
        let person =
            Person(entity: entity, insertInto: managedContext)
        
        person.age = age
        person.name = name
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func removePerson(_ person:Person){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        managedContext.delete(person)
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
}
