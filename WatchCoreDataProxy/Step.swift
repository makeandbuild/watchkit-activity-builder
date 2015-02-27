//
//  Step.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/24/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import CoreData


public class Step: NSManagedObject {

    @NSManaged public var name: String
    @NSManaged public var detail: String
    @NSManaged public var status: String
    @NSManaged public var activity: Activity
    @NSManaged public var number: Int16

}
