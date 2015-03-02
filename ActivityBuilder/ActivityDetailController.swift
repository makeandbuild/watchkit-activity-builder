//
//  ActivityDetailController.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/26/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import UIKit
import WatchCoreDataProxy

/**
 * Used for creating and editing activities
 */
class ActivityDetailController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let stepCellIdentifier = "StepCell"
    
    var activity:Activity?
    
    var steps:[Step] = [Step]()
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var addStepButton: UIButton!
    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.title = activity == nil ? "Add Activity" : "Edit Activity"
        
        nameField.text = activity?.name ?? ""
        
        enableAddStepIfNecessary()

        
        if activity?.steps != nil {
//             steps = activity!.steps.allObjects as! [Step]
            steps = activity!.stepsSortedByNumber()
            
        } else {
            steps = [Step]()
        }
        
        self.table.reloadData()
    }
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        
        println("Done button tapped")
        
        saveActivity()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    func saveActivity() {
        if activity == nil {
            // create a new activity
            activity = ActivityManager.createActivity(nameField.text, category: "", details: "", steps: nil)
        } else {
            // update existing activity
            activity?.name = nameField.text
            DataManager.saveManagedContext()
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        view.endEditing(true)
        
        // auto-save activity
        if (!nameField.text.isEmpty) {
            saveActivity()
        }
        enableAddStepIfNecessary()
        
        super.touchesBegan(touches, withEvent: event)
    }
    
    func enableAddStepIfNecessary() {
        var addStepsEnabled = !nameField.text.isEmpty
        addStepButton.enabled = addStepsEnabled
    }
    
    
    // MARK: - Table View
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(stepCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        
        let row = indexPath.row
        var step = steps[row]
        cell.textLabel?.text = step.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            var deletedStep = steps.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            StepManager.deleteStep(deletedStep)
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var stepDetailController:StepDetailController = segue.destinationViewController as! StepDetailController
        
        if (segue.identifier == "addStep") {
            if (activity == nil) {
                saveActivity()
            }
            stepDetailController.activity = activity
            
        } else if (segue.identifier == "stepDetail") {
            var selectedIndexPath:NSIndexPath = self.table.indexPathForSelectedRow()!
            
            stepDetailController.step = steps[selectedIndexPath.row]
        }
    }

    func showValidationError() {
        let alertController = UIAlertController(title: "Validation Error", message:
            "Activity Name is Required", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
