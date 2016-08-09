//
//  NetworkManager.swift
//  Photog
//
//  Created by Eric Sproles on 4/27/16.
//  Copyright © 2016 Sprolex. All rights reserved.
//

import Foundation
import Parse

typealias ObjectsCompletionHandler = (objects: [AnyObject]?, error: NSError?) -> ()
typealias ImageCompletionHandler = (image: UIImage?, error: NSError?) -> ()


public class NetworkManager
{
    public class var sharedInstance: NetworkManager
    {
        struct Singleton
        {
            static let instance = NetworkManager()
        }
        return Singleton.instance
    }

    func follow(user: PFUser!, completionHandler:(error: NSError?) -> ())
    {
        let relation = PFUser.currentUser()!.relationForKey("Following")
        relation.addObject(user)
        PFUser.currentUser()!.saveInBackgroundWithBlock {
            (success, error) -> Void in
            
            completionHandler(error: error)
        }
        
        
    }
    
    func fetchFeed(completionHandler: ObjectsCompletionHandler!)
    {
        let relation = PFUser.currentUser()!.relationForKey("Following")
        let query = relation.query()
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in

            if let constError = error
            {
                print("error fetching following")
                completionHandler(objects: nil, error: constError)
            }
            else // Fetch the array of posts
            {
                let postQuery = PFQuery(className: "Post")
                postQuery.whereKey("User", containedIn: objects!)
                postQuery.orderByDescending("createdAt")
                postQuery.findObjectsInBackgroundWithBlock({ (objects: [PFObject]?, error: NSError?) -> Void in
    
                completionHandler(objects: objects, error: error)
                
                })
            }
        }
    }
    
    func fetchImage(post: PFObject!, completionHandler: ImageCompletionHandler!)
    {
        let imageReference = post["Image"] as! PFFile
        imageReference.getDataInBackgroundWithBlock {
            (data, error) -> Void in
            
            if (error != nil) // Print the error and pass it to the completionHandler
            {
                print("Error fetching image \(error!.localizedDescription)")
                completionHandler(image: nil, error: error)
            }
            else // Download the Image
            {
                let image = UIImage(data: data!)
                completionHandler(image:image, error: nil)
                
            }
        }
    }



}