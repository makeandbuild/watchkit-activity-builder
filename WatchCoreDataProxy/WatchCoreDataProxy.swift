//
//  WatchCoreDataProxy.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/24/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import CoreData

public class WatchCoreDataProxy: NSObject {
    
    let sharedAppGroup:String = "group.com.makeandbuild.activitybuilder"
    
    public class var sharedInstance : WatchCoreDataProxy {
        struct Static {
            static let instance : WatchCoreDataProxy = WatchCoreDataProxy()
        }
        return Static.instance
    }
    
    // MARK: - Core Data stack
    
    public lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.makeandbuild.ActivityBuilder" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] as! NSURL
        }()
    
    public lazy var managedObjectModel: NSManagedObjectModel = {
        let proxyBundle = NSBundle(identifier: "com.makeandbuild.WatchCoreDataProxy")
        
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = proxyBundle?.URLForResource("Model", withExtension: "momd")!

        return NSManagedObjectModel(contentsOfURL: modelURL!)!
        }()
    
    public lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.

        var error: NSError? = nil

        var sharedContainerURL: NSURL? = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(self.sharedAppGroup)
        if let sharedContainerURL = sharedContainerURL {
            let storeURL = sharedContainerURL.URLByAppendingPathComponent("Model.sqlite")
            var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
            if coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil, error: &error) == nil {
                
                var dict = [String: AnyObject]()
                dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
                dict[NSLocalizedFailureReasonErrorKey] = "There was an error creating or loading the application's saved data."
                dict[NSUnderlyingErrorKey] = error
                error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
                // Replace this with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
  
            }
            return coordinator
        }
        return nil
        }()
    
    public lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
        }()
    
    // MARK: - Core Data Saving support
    
    public func saveContext () {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges && !moc.save(&error) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
    }
    
}
