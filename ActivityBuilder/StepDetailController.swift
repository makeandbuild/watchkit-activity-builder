//
//  StepDetailController.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/27/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import UIKit
import WatchCoreDataProxy

class StepDetailController: UIViewController {
    
    var step:Step?
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var detailsTextView: UITextView!
    
    
    override func viewDidLoad() {
        self.title = step == nil ? "Add Step" : "Edit Step"
        nameField.text = step?.name ?? ""
        detailsTextView.text = step?.detail ?? ""
    }
    
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        
        println("done button tapped")
        
        if step == nil {
            // create new step
            step = StepManager.createStep(nameField.text, detail: detailsTextView.text, number: 1, status: "")
        } else {
            // update existing step
            step?.name = nameField.text
            step?.detail = detailsTextView.text
            StepManager.saveManagedContext()
        }
        
        popToActivitiesView()
    }
    
    func popToActivitiesView() {
        for view in navigationController!.viewControllers {
            if view is ActivityDetailController {
                self.navigationController?.popToViewController(view as! UIViewController, animated: true)
                return
            }
        }
    }

}
