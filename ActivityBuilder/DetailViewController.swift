//
//  DetailViewController.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/23/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import UIKit
import WatchCoreDataProxy

class DetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    
    var step:Step? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.userInteractionEnabled = false
        notesTextView.userInteractionEnabled = false
        
//        titleTextField.text = activityData.objectForKey("itemTitle") as? String
//        notesTextView.text = activityData.objectForKey("itemNote") as? String
        titleTextField.text = step?.name ?? ""
        notesTextView.text = step?.detail ?? ""

        
        // todo - change to use core data
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteItem(sender: AnyObject) {
        
        if (step != nil) {
            StepManager.deleteStep(step!)
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
