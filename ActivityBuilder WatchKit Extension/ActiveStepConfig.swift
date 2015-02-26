//
//  ActiveStepConfig.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/26/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import WatchKit
import WatchCoreDataProxy

class ActiveStepConfig: NSObject {

    var index: Int = 0
    var activeStep:Step?
    var steps:[Step] = []
    
    init(index: Int, steps:[Step]) {
        super.init()
        self.index = index
        self.steps = steps
        if (self.steps.count > self.index) {
            activeStep = self.steps[self.index]
        }
    }
    
    func numSteps() ->Int {
        return steps.count
    }
    
    func isLastStep() -> Bool {
        return index >= numSteps() - 1
    }
    
    func isFirstStep() -> Bool {
        return index == 0
    }
    
    func isOnlyStep() -> Bool {
        return numSteps() == 1
    }
    
    func nextStep() -> Step? {
        if index + 1 < numSteps() {
            return steps[index+1]
        }
        return nil
    }
    
//    func prevStep() -> Step? {
//        if index - 1 >= 0 {
//            return steps[index-1]
//        }
//        return nil        
//    }
    
}
