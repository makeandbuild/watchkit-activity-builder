//
//  ActivityTableController.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/26/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import UIKit
import WatchCoreDataProxy

class ActivityTableController: UITableViewController {
    
    let cellIdentifier = "ActivityCell"
    
    var activities = [Activity]()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        
        activities = ActivityManager.fetchActivities()
        
        self.tableView.reloadData()
    }
    
    // MARK: - Table View
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        
        let row = indexPath.row
        var activity:Activity = activities[row]
        cell.textLabel?.text = activity.name
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            var deletedActivity = activities.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            ActivityManager.deleteActivity(deletedActivity)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "addActivity") {
            // nothing to do here - ActivityDetailController can handle a nil activity
        }
        else if (segue.identifier == "showDetail") {
            var selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            var activityDetailController:ActivityDetailController = segue.destinationViewController as! ActivityDetailController
            activityDetailController.activity = activities[selectedIndexPath.row]
            
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
