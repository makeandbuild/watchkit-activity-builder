//
//  Activity.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/24/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import CoreData


public class Activity: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var category: String
    @NSManaged var detail: String

}
