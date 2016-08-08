//
//  TableViewController.swift
//  laolin
//
//  Created by yesway on 16/7/5.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let array: [String] = ["Uncomment the following line to display an Edit button in the navigation bar for this viewUncomment the following line to display an Edit button in the navigation bar for this view false","Uncomment the following line to display an Edit button in the navigation bar for this view controller. self.navigationItem.rightBarButtonItem = self.editButtonItem()","Uncomment the following line to display an Edit button in the navigation bar for this view controller."]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.backgroundColor = UIColor.lightGrayColor()
        
        
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIContentSizeCategoryDidChangeNotification, object: nil, queue: NSOperationQueue.mainQueue()) { [unowned self] _ in
            self .dkdkdk()
        }
        
    }
    
    func dkdkdk () {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        cell.label.text = array[indexPath.row]
        cell.name.text = "joker"
        let string = String(indexPath.row)
        cell.imageIcon = UIImage(named: string)
        return cell
    }
 
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! TableViewCell
        
        cell.label.text = "Uncomment the following line to display an Edit button in the navigation bar for this viewUncomment the following line to display an Edit button in the navigation bar for this view falseUncomment the following line to display an Edit button in the navigation bar for this viewUncomment the following line to display an Edit button in the navigation bar for this view falseUncomment the following line to display an Edit button in the navigation bar for this viewUncomment the following line to display an Edit button in the navigation bar for this view false"
        
        
        UIView.animateWithDuration(0.3) { 
            cell.contentView.layoutIfNeeded()
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
