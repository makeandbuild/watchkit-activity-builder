//
//  AddViewController.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/23/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import UIKit
import WatchCoreDataProxy

class AddViewController: UIViewController {
    
    
    @IBOutlet var titleTextField: UITextField!

    @IBOutlet var notesTextView: UITextView!
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addButtonTapped(sender: AnyObject) {
        println("Button tabbed")
        
        var newStep = StepManager.createStepManaged(titleTextField.text, detail: notesTextView.text, number: 1, status: "")
        
        
        // todo: change to use core data
//        var userDefaults:NSUserDefaults = NSUserDefaults(suiteName: "group.com.makeandbuild.activitybuilder")!
//        
//        var itemList:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
//        
//        
//        var dataSet:NSMutableDictionary = NSMutableDictionary()
//        dataSet.setObject(titleTextField.text, forKey: "itemTitle")
//        dataSet.setObject(notesTextView.text, forKey: "itemNote")
//
//        if (itemList != nil) { // data already avaliable
//            var newMutableList:NSMutableArray = NSMutableArray()
//            for dict:AnyObject in itemList! {
//                newMutableList.addObject(dict as NSDictionary)
//            }
//            
//            userDefaults.removeObjectForKey("itemList")
//            newMutableList.addObject(dataSet)
//            userDefaults.setObject(newMutableList, forKey: "itemList")
//        }
//        // first item in the list
//        else {
//            itemList = NSMutableArray()
//            itemList!.addObject(dataSet)
//            userDefaults.setObject(itemList, forKey: "itemList")
//        }
//        userDefaults.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
}
