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
    
    public class func createStep(name: String, detail: String, number: Int16, status: String, activity:Activity) -> Step {
        
        let newStep: Step = NSEntityDescription.insertNewObjectForEntityForName("Step", inManagedObjectContext: DataManager.getContext()) as! Step
        
        newStep.name = name
        newStep.detail = detail
        newStep.number = number
        newStep.status = status
        newStep.activity = activity
        
        DataManager.saveManagedContext()
        
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
        
        if let steps:[Step] = DataManager.getContext().executeFetchRequest(fetchRequest, error: &error) as? [Step] {
            return steps
        }
        else {
            return [Step]()
        }
    }
    
    public class func deleteStep(step:Step) {
        DataManager.deleteManagedObject(step)
    }

}
