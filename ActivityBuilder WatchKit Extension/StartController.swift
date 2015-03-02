//
//  StartController.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/25/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import WatchKit
import WatchCoreDataProxy

class StartController: WKInterfaceController {

    
    @IBOutlet weak var activityButton: WKInterfaceButton!
    @IBOutlet weak var startButton: WKInterfaceButton!
    
    var currentActivity:Activity?
    
    @IBAction func startActivity() {
        // navigates to screen displaying the first step
        
        var steps = currentActivity!.stepsSortedByNumber()
        
        self.pushControllerWithName("activeStepController", context: ActiveStepConfig(index: 0, steps: steps))
    
    }
    
    @IBAction func viewActivityDetails() {
        // navigate to the interface controller
        // TODO: eventually want to pass the activity name so the stepListController knows which activity to display
        self.pushControllerWithName("stepListController", context: currentActivity)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
            
        currentActivity = context as? Activity
            
//        var font = UIFont.systemFontOfSize(20)
//        var specialString = NSAttributedString(string: currentActivity!.name, attributes: [NSFontAttributeName:font])
        self.activityButton.setTitle(currentActivity!.name)
//        self.nameLabel.setAttributedText(specialString)
            
        // Configure interface objects here.
    }
}
