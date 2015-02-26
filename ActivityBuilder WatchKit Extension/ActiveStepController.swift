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
    
    @IBOutlet weak var stepNameButton: WKInterfaceButton!
    
    @IBOutlet weak var nextButton: WKInterfaceButton!
    
//    @IBOutlet weak var previousButton: WKInterfaceButton!
    
    override func awakeWithContext(context: AnyObject?) {
        self.config = context as? ActiveStepConfig
        
        var activeStep = config?.activeStep
        stepNameButton.setTitle(activeStep?.name)
        
//        var prevEnabled = !config!.isFirstStep() && !config!.isOnlyStep()
//        self.previousButton.setEnabled(prevEnabled)

        var nextEnabled = !config!.isLastStep() && !config!.isOnlyStep()
        self.nextButton.setEnabled(nextEnabled)
    }
    
    
    @IBAction func showStepDetail() {
        self.pushControllerWithName("detailActivityController", context: config?.activeStep)
    }

    @IBAction func goToNextStep() {
        // should only be enabled if there really is a next step
        self.pushControllerWithName("activeStepController", context: ActiveStepConfig(index: config!.index + 1, steps: config!.steps))
    }
    
    // TODO: do we even need a previous?  I think you can just use the back button
//    @IBAction func goToPreviousStep() {
//        // should only be enabled if there really is a previous step
//        self.pushControllerWithName("activeStepController", context: ActiveStepConfig(index: config!.index - 1, steps: config!.steps))
//    }
//    
}
