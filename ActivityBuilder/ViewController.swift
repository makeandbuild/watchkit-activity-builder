//
//  ViewController.swift
//  ActivityBuilder
//
//  Created by Lindsay Thurmond on 2/23/15.
//  Copyright (c) 2015 Make and Build. All rights reserved.
//

import UIKit
import WatchCoreDataProxy


class ViewController: UITableViewController {
    
    let cellIdentifier = "Cell"
    
    var steps = []
    
    // TODO: probably pull this into a data manager class
    // Retreive the managedObjectContext from AppDelegate
//    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    
    override func viewDidAppear(animated: Bool) {
        
        steps =  StepManager.fetchSteps()
        
        
//        var userDefaults:NSUserDefaults = NSUserDefaults(suiteName: "group.com.makeandbuild.activitybuilder")!
//        
//        var itemListFromUserDefaults:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
//        if (itemListFromUserDefaults != nil) {
//            activityItems = itemListFromUserDefaults!
//        }
        
        self.tableView.reloadData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table View
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        
        let row = indexPath.row
        var step = steps[row] as! Step
        cell.textLabel?.text = step.name
        
        
//        cell.textLabel?.text = swiftBlogs[row]
        
        return cell
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        
//        return cellAtIndexPath(indexPath)
//    }
//
//    func cellAtIndexPath(indexPath:NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! UITableViewCell
//        
//        var row = indexPath.row
//        var step = steps[row] as! Step
//        cell.textLabel?.text = step.name
//        
//        
////        var step:NSDictionary = steps.objectAtIndex(indexPath.row) as NSDictionary
////        cell.textLabel?.text = step.objectForKey("itemTitle") as? String
//
//        
//        //        cell.detailTextLabel?.text = activityItem.objectForKey("itemNote") as? String
//        
//        
////        setTitleForCell(cell, indexPath: indexPath)
////        setSubtitleForCell(cell, indexPath: indexPath)
//        return cell
//    }
//
//    func setTitleForCell(cell:BasicCell, indexPath:NSIndexPath) {
//        let item = items[indexPath.row] as RSSItem
//        cell.titleLabel.text = item.title ?? "[No Title]"
//    }
//    
//    func setSubtitleForCell(cell:BasicCell, indexPath:NSIndexPath) {
//        let item = items[indexPath.row] as RSSItem
//        var subtitle: NSString! = item.mediaText ?? item.mediaDescription
//        
//        // Some subtitles are really long, so only display the first 200 characters
//        if subtitle != nil {
//            cell.subtitleLabel.text = subtitle.length > 200 ? "\(subtitle.substringToIndex(200))..." : subtitle
//        } else {
//            cell.subtitleLabel.text = ""
//        }
//    }
    
    /*
    MARK: - Navigation
    */
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showDetail") {
            var selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            var detailViewController:DetailViewController = segue.destinationViewController as! DetailViewController
//            detailViewController.activityData = activityItems.objectAtIndex(selectedIndexPath.row) as NSDictionary
            detailViewController.step = steps[selectedIndexPath.row] as? Step
            
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}

