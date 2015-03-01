//
//  StepManager.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/24/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import CoreData


public class StepManager: NSObject {

    public class var sharedInstance : StepManager {
        struct Static {
            static let instance : StepManager = StepManager()
        }
        return Static.instance
    }
    
    class func getContext()->NSManagedObjectContext {
        return WatchCoreDataProxy.sharedInstance.managedObjectContext!
    }
    
    public class func createStep(name: String, detail: String, number: Int16, status: String, activity:Activity) -> Step {
        
        let newStep: Step = NSEntityDescription.insertNewObjectForEntityForName("Step", inManagedObjectContext: getContext()) as! Step
        
        newStep.name = name
        newStep.detail = detail
        newStep.number = number
        newStep.status = status
        newStep.activity = activity
        
        saveManagedContext()
        
        return newStep
    }
    
    public class func fetchAllSteps() -> [Step] {
        let fetchRequest = NSFetchRequest(entityName: "Step")
        
        // Create a sort descriptor object that sorts on the "name"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "number", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        var error: NSError? = nil
        
        if let steps:[Step] = getContext().executeFetchRequest(fetchRequest, error: &error) as? [Step] {
            return steps
        }
        else {
            return []
        }
    }
    
//    public class func fetchSteps(activity:Activity) {
//        let fetchRequest = NSFetchRequest(entityName: "Step")
//        
//    }
    
    public class func deleteStep(step:Step) {
        getContext().deleteObject(step)
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
