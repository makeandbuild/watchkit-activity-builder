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
    
    var steps = []
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.title = activity == nil ? "Add Activity" : "Edit Activity"
        
        nameField.text = activity?.name ?? ""
        
        if activity?.steps != nil {
//             steps = activity!.steps.allObjects as! [Step]
            steps = activity!.stepsSortedByNumber()
            
        } else {
            steps = []
        }
        
        self.table.reloadData()
    }
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        
        println("Done button tapped")
        
        if activity == nil {
            // create a new activity
            activity = ActivityManager.createActivity(nameField.text, category: "", details: "", steps: nil)
        } else {
            // update existing activity
            activity?.name = nameField.text
            ActivityManager.saveManagedContext()
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
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
        var step = steps[row] as! Step
        cell.textLabel?.text = step.name
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var stepDetailController:StepDetailController = segue.destinationViewController as! StepDetailController
        
        if (segue.identifier == "addStep") {
            stepDetailController.activity = activity
            
        } else if (segue.identifier == "stepDetail") {
            var selectedIndexPath:NSIndexPath = self.table.indexPathForSelectedRow()!
            
            stepDetailController.step = steps[selectedIndexPath.row] as? Step
        }
    }

}
