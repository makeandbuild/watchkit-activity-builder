//
//  InterfaceController.swift
//  ActivityBuilder WatchKit Extension
//
//  Created by Lindsay Thurmond on 2/23/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import WatchKit
import Foundation
import WatchCoreDataProxy


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    
    // todo: as much as I love emojis  replace with actual step data
    var activities:[Step] = []
    //    var activities = ["🐶","🐷","🐼"]
    var details = ["Dog", "Pig", "Panda"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        activities = StepManager.fetchSteps()
        
        // get list of activities from app - todo: do this with core data instead
//        var userDefaults:NSUserDefaults = NSUserDefaults(suiteName: "group.com.makeandbuild.activitybuilder")!
//        
//        var itemListFromUserDefaults:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
//        if (itemListFromUserDefaults != nil) {
//            activities = itemListFromUserDefaults!
//        }

        
        self.table.setNumberOfRows(self.activities.count, withRowType: "ActivityRow")
        
        for index in 0..<self.activities.count {
            var theRow = self.table.rowControllerAtIndex(index) as! ActivityRow
            var stepData:Step = self.activities[index] as Step
            theRow.activityRowLabel.setText(stepData.name)
        }
        
        // Configure interface objects here.
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.pushControllerWithName("zoomActivityController", context: self.activities[rowIndex])
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
