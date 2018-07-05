//
//  CoreDatePeopleViewController.swift
//  MyGalaxyOfAppleSdks
//
//  Created by Serhat Sarı on 5.07.2018.
//  Copyright © 2018 Serabisa. All rights reserved.
//

import UIKit

class CoreDatePeopleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "People"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addName))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadData()
    }
    
    func loadData() {
        people = PeopleManager.shared().ageOrderedPeople()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Implement the addName IBAction
    @IBAction func addName(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "New Person",
                                      message: "Add a new name and age",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) {
                                        [unowned self] action in
                                        
                                        guard let textField = alert.textFields?.first,
                                            let nameToSave = textField.text else {
                                                return
                                        }
                                        guard let textField2 = alert.textFields?.last,
                                            let ageToSave = textField2.text else {
                                                return
                                        }
                                        
                                        PeopleManager.shared().save(name: nameToSave, age: Int16(ageToSave) ?? 0)
                                        self.loadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        
        alert.addTextField()
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }

}

// MARK: - UITableViewDataSource
extension CoreDatePeopleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
            
            let person = people[indexPath.row]
            cell.textLabel?.text = person.name
            cell.detailTextLabel?.text = "Age: \(person.age)"
            return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            let person = people[indexPath.row]
            PeopleManager.shared().removePerson(person)
            self.loadData()
        }
    }
}
