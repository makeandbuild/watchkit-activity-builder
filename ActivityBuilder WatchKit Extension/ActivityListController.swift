//
//  ActivitiesController.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 3/1/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import WatchKit
import WatchCoreDataProxy

class ActivityListController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    
    var activities:[Activity] = []
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        activities = ActivityManager.fetchActivities()
        
        // TODO: handle no activities case
        
        self.table.setNumberOfRows(self.activities.count, withRowType: "ActivityRow")
        
        for index in 0..<self.activities.count {
            var theRow = self.table.rowControllerAtIndex(index) as! ActivityRow
            var activityData:Activity = self.activities[index] as Activity
            theRow.nameLabel.setText(activityData.name)
        }
        
        // Configure interface objects here.
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.pushControllerWithName("startController", context: self.activities[rowIndex])
    }
    
}
