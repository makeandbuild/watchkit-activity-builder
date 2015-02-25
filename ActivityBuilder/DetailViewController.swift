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
    
    
    var activityData:Step? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.userInteractionEnabled = false
        notesTextView.userInteractionEnabled = false
        
//        titleTextField.text = activityData.objectForKey("itemTitle") as? String
//        notesTextView.text = activityData.objectForKey("itemNote") as? String
        titleTextField.text = activityData?.name ?? ""
        notesTextView.text = activityData?.detail ?? ""

        
        // todo - change to use core data
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteItem(sender: AnyObject) {
        
        // TODO: fix me
        
//        var userDefaults:NSUserDefaults = NSUserDefaults(suiteName: "group.com.makeandbuild.activitybuilder")!
//        var itemListArray:NSMutableArray = userDefaults.objectForKey("itemList") as NSMutableArray
//        var mutableItemList:NSMutableArray = NSMutableArray()
//        
//        for dict:AnyObject in itemListArray{
//            mutableItemList.addObject(dict as NSDictionary)
//        }
//        
//        mutableItemList.removeObject(activityData)
//        
//        // TODO: use core data
//        userDefaults.removeObjectForKey("itemList")
//        userDefaults.setObject(mutableItemList, forKey: "itemList")
//        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    




}
