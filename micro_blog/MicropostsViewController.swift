//
//  MicropostsViewController.swift
//  micro_blog
//
//  Created by Nakayama on 2016/05/15.
//  Copyright © 2016年 Nakayama. All rights reserved.
//

import UIKit

class MicropostsViewController: UITableViewController {
    
    private var microposts:[Micropost] = [
        Micropost(title: "hoge", body: "hogehoge"),
        Micropost(title: "foo", body: "foofoo"),
        Micropost(title: "bar", body: "barbar")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(MicropostsViewController.onRefresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func onRefresh(sender: UIRefreshControl) {
        refreshControl?.beginRefreshing()
        Micropost.getMicroposts(
            success: {(microposts) -> Void in
                self.microposts = microposts.reverse()
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()},
            failure: {(error) -> Void in
                let alertController = UIAlertController(
                    title: "Error",
                    message: "Error Message",
                    preferredStyle: .Alert)
                
                alertController.addAction(UIAlertAction(
                    title: "OK", style: .Default, handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                self.refreshControl?.endRefreshing()
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return microposts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        let micropost = microposts[indexPath.row]
        cell.textLabel?.text = micropost.title
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let micropost = self.microposts[indexPath.row]
            micropost.deleteMicropost(
                success: {
                    print("success delete")
                    self.microposts.removeAtIndex(indexPath.row)
                    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                },
                failure: { (error) in
                    print(error)
                    print("fail delete")
                }
            )
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let micropost = microposts[indexPath.row]
                let controller = segue.destinationViewController as! MicropostDetailViewController
                controller.micropost = micropost
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        refreshData()
    }
    
    func refreshData() {
        Micropost.getMicroposts(
            success: {(microposts) -> Void in
                self.microposts = microposts.reverse()
                self.tableView.reloadData()
            },
            failure: {(error) -> Void in
                let alertController = UIAlertController(
                    title: "Error",
                    message: "Error Message",
                    preferredStyle: .Alert)
                
                alertController.addAction(UIAlertAction(
                    title: "OK",
                    style: .Default,
                    handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
        })
    }
}
