//
//  ZoomActivityController.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/23/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import WatchKit
import Foundation


class ZoomActivityController: WKInterfaceController {
    
    @IBOutlet weak var zoomActivityLabel: WKInterfaceLabel!
    
    @IBOutlet weak var detailLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var activity = context as! String
        
        var font = UIFont.systemFontOfSize(90)
        var specialString = NSAttributedString(string: activity, attributes: [NSFontAttributeName:font])
        self.zoomActivityLabel.setAttributedText(specialString)
        
        var detail = "No details"
        if (activity == "") {
        
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
