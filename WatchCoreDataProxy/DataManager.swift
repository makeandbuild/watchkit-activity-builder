//
//  DataManager.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 3/2/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import CoreData

public class DataManager: NSObject {
    
    public class func getContext() -> NSManagedObjectContext {
        return WatchCoreDataProxy.sharedInstance.managedObjectContext!
    }
    
    public class func deleteManagedObject(object:NSManagedObject) {
        getContext().deleteObject(object)
        saveManagedContext()
    }
    
    public class func saveManagedContext() {
        var error : NSError? = nil
        if !getContext().save(&error) {
            NSLog("Unresolved error saving context \(error), \(error!.userInfo)")
            abort()
        }
    }

}
