//
//  Activity.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/24/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import CoreData


public class Activity: NSManagedObject {

    @NSManaged public var name: String
    @NSManaged public var category: String
    @NSManaged public var detail: String
    @NSManaged public var steps:NSSet?
    
    public func stepsSortedByNumber() -> [Step] {
        if steps != nil {
            return self.steps!.sortedArrayUsingDescriptors([NSSortDescriptor(key: "number", ascending: true)]) as! [Step]
        }
        return []
    }

}
