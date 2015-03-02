//
//  ActiveStepController.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/26/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import WatchKit
import WatchCoreDataProxy

class ActiveStepController: WKInterfaceController {
    
    var config: ActiveStepConfig?
    
    @IBOutlet weak var activityNameLabel: WKInterfaceLabel!
    
    @IBOutlet weak var stepNameButton: WKInterfaceButton!
    
    @IBOutlet weak var nextButton: WKInterfaceButton!
    
    @IBOutlet weak var finishButton: WKInterfaceButton!
    
    override func awakeWithContext(context: AnyObject?) {
        self.config = context as? ActiveStepConfig
        
        var activeStep = config?.activeStep
        stepNameButton.setTitle(activeStep?.name)
        
        var font = UIFont.systemFontOfSize(20)
        
        var activityLabel = "Unknown"
        if (activeStep?.activity != nil) {
            activityLabel = activeStep!.activity.name
        }
        
        var specialString = NSAttributedString(string: activityLabel, attributes: [NSFontAttributeName:font])
        self.activityNameLabel.setAttributedText(specialString)
        
        var nextHidden = config!.isLastStep() || config!.isOnlyStep()
        self.nextButton.setHidden(nextHidden)
        
        // TODO: - maybe show on every screen page?
        self.finishButton.setHidden(!nextHidden)
    }
    
    
    @IBAction func showStepDetail() {
        self.pushControllerWithName("stepDetailController", context: config?.activeStep)
    }

    @IBAction func goToNextStep() {
        // should only be enabled if there really is a next step
        self.pushControllerWithName("activeStepController", context: ActiveStepConfig(index: config!.index + 1, steps: config!.steps))
    }
    
    @IBAction func finishActivity() {
        self.popToRootController()
    }
}
