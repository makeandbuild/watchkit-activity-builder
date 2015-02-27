//
//  WatchCoreDataProxy.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/26/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import Foundation
import CoreData

class WatchCoreDataProxy: NSManagedObject {

    @NSManaged var detail: String
    @NSManaged var name: String
    @NSManaged var number: NSNumber
    @NSManaged var status: String
    @NSManaged var activity: WatchCoreDataProxy.Activity

}
