//
//  InterfaceController.swift
//  ActivityBuilder WatchKit Extension
//
//  Created by Lindsay Thurmond on 2/23/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import WatchKit
import WatchCoreDataProxy


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!

    var steps:[Step] = [Step]()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var activity = context as! Activity
        steps = activity.stepsSortedByNumber()
        
        self.table.setNumberOfRows(self.steps.count, withRowType: "StepRow")
        
        for index in 0..<self.steps.count {
            var theRow = self.table.rowControllerAtIndex(index) as! StepRow
            var stepData:Step = self.steps[index] as Step
            theRow.nameLabel.setText(stepData.name)
        }
        
        // Configure interface objects here.
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.pushControllerWithName("detailActivityController", context: self.steps[rowIndex])
    }

}
