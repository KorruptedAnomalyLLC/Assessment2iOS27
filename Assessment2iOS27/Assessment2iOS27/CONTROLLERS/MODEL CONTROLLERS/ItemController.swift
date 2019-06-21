//
//  ItemController.swift
//  Assessment2iOS27
//
//  Created by Austin West on 6/21/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation
import CoreData

class ItemController {
    
    var items: [Item] = []
    
    var fetchedResultsController: NSFetchedResultsController<Item>
    
    
    static let shared = ItemController()
    
    init() {
        
        let fetchedRequest: NSFetchRequest<Item> = Item.fetchRequest()
        fetchedRequest.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
        
        let resultsController: NSFetchedResultsController<Item> = NSFetchedResultsController(fetchRequest: fetchedRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController = resultsController
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error with the fetch! \(error.localizedDescription)")
        }
    }
    
    func add(itemWithName name: String) {
        let _ = Item(name: name)
        saveToPersistentStore()
        items = fetchItems()
    }
    
    func update(item: Item, name: String) {
        item.name = name
        saveToPersistentStore()
        items = fetchItems()
    }
    
    func remove(item: Item) {
        item.managedObjectContext?.delete(item)
        saveToPersistentStore()
        items = fetchItems()
    }
    
    func togglesIsCompleteFor(item: Item) {
        saveToPersistentStore()
        item.isComplete = !item.isComplete
    }
    
    private func saveToPersistentStore() {
        
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
    
    private func fetchItems() -> [Item] {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
    
}



