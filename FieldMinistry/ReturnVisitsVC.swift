//
//  ReturnVisitsVC.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 3/14/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit
import CoreData


class ReturnVisitsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var controller: NSFetchedResultsController<ReturnVisit>!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        //generateTestData()
        attemptFetch()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func configureCell(cell: ItemCell, indexPath: NSIndexPath) {

        let item = controller.object(at: indexPath as IndexPath)
        cell.configureCell(item: item)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let sections = controller.sections {
            return sections.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let objs = controller.fetchedObjects ,  objs.count > 0 {
            
            let item = objs[indexPath.row]
            performSegue(withIdentifier: "ReturnVisitVCEdit", sender: item)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReturnVisitVCEdit" {
            if let destination = segue.destination as? ReturnVisitDetailsVC {
                if let item = sender as? ReturnVisit {
                    destination.itemToEdit = item
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let sections = controller.sections {
            
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    func attemptFetch() {
        
        let fetchRequest: NSFetchRequest<ReturnVisit> = ReturnVisit.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        do {
            
            try controller.performFetch()
            
        } catch {
            
            let error = error as NSError
            print("\(error)")
            
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type) {
            
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
            
        case.update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! ItemCell

                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)

            
            }
            break
            
        case.move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
        }
    }
    
//    func generateTestData() {
//        
//        let item = ReturnVisit(context: context)
//        item.nameSuffix = "Mr."
//        item.firstName = "Johnny"
//        item.lastName = "Appleseed"
//        item.address = "160 wellstone drive"
//        item.phoneNumber = "999-999-9999"
//        item.email = "person@outlook.com"
//        
//        let item2 = ReturnVisit(context: context)
//        item2.nameSuffix = "Mrs."
//        item2.firstName = "Lady"
//        item2.lastName = "Linconson"
//        item2.address = "160 wellstone drive"
//        item2.phoneNumber = "999-999-9999"
//        item2.email = "person@outlook.com"
//        
//        let item3 = ReturnVisit(context: context)
//        item3.nameSuffix = "Senior"
//        item3.firstName = "lipsa"
//        item3.lastName = "Porenzo"
//        item3.address = "160 wellstone drive"
//        item3.phoneNumber = "999-999-9999"
//        item3.email = "person@outlook.com"
//        
//        ad.saveContext()
//    }
    
    
    
    
}



















