//
//  Item+Convenience.swift
//  Assessment2iOS27
//
//  Created by Austin West on 6/21/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation
import CoreData

extension Item {
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.name = name
        self.isComplete = false
    }
}
