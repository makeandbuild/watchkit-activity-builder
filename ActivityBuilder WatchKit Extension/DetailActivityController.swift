//
//  DetailActivityController.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/23/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import WatchKit
import WatchCoreDataProxy


class DetailActivityController: WKInterfaceController {
    
    @IBOutlet weak var nameLabel: WKInterfaceLabel!
    
    @IBOutlet weak var detailLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var step = context as! Step
        
        var font = UIFont.systemFontOfSize(20)
        var specialString = NSAttributedString(string: step.name, attributes: [NSFontAttributeName:font])
        self.nameLabel.setAttributedText(specialString)
        
        var detail = step.detail
        if (detail == "") {
            detail = "No details"
        }
        self.detailLabel.setText(detail)
        
        // Configure interface objects here.
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
