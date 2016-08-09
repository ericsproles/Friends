//
//  FeedViewController.swift
//  Photog
//
//  Created by Eric Sproles on 4/29/16.
//  Copyright © 2016 Sprolex. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    var items = []

    @IBOutlet var tableView: UITableView?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let nib = UINib(nibName: "PostCell", bundle: nil)
        tableView?.registerNib(nib, forCellReuseIdentifier: "PostCellIdentifier")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NetworkManager.sharedInstance.fetchFeed {
        (objects, error) -> () in
            
            print(objects)
            print(error)
            
            if let constObjects = objects
            {
                self.items = constObjects
                self.tableView?.reloadData()
            }
            else if let constError = error
            {
                // Alert the user
            }
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCellIdentifier") as! PostCell
        let item = items[indexPath.row] as! PFObject
        
        cell.post = item
        
        return cell
        
    }
}
