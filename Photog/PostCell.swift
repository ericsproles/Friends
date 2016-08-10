//
//  PostCell.swift
//  Photog
//
//  Created by Eric Sproles on 4/29/16.
//  Copyright © 2016 Sprolex. All rights reserved.
//feature1 added

import UIKit
import Parse


class PostCell: UITableViewCell {
    
    @IBOutlet var postImageView: UIImageView?
    @IBOutlet var usernameLabel: UILabel?
    @IBOutlet var dateLabel: UILabel?

    var post: PFObject?
    {
        didSet
        {
            print(self.post)
            self.configure()
        }
    }
    
    override func awakeFromNib() {
        // Initialization method for cells. Nudging cell out of its slumber, or woken up
        super.awakeFromNib()
        
        self.contentView.backgroundColor = UIColor.TronLightGray()
        self.usernameLabel?.text = nil
        self.dateLabel?.text = nil
    }
    
    override func prepareForReuse() {
        // Reuse already created cell
        super.prepareForReuse()
        
        self.postImageView?.image = UIImage(named: "PostPlaceholderImage")
        self.usernameLabel?.text = nil
        self.dateLabel?.text = nil
        self.post = nil
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure()
    {
        // Configure the view for the selected state
        // Clip the post Image to the bounds of UIImageView
        self.postImageView!.clipsToBounds = true
        
        if let constPost = post
        {
            // Set the username label, get the whole User object
            
            let user = constPost["User"] as! PFUser
            user.fetchIfNeededInBackgroundWithBlock({
                (object, error) -> Void in
                
                if let constObject = object
                {
                    self.usernameLabel!.text = user.username
                }
                else if let constError = error
                {
                    //Alert the user
                }
            })
            
            // Set the date label
            
            let date = constPost.createdAt
            self.dateLabel?.text = date!.fuzzyTime()
            
            
            // Download the image and display it
            
            // NetworkManager download the imagine, callback
            NetworkManager.sharedInstance.fetchImage(constPost, completionHandler: {
                (image, error) in
                
                if image != nil
                {
                    self.postImageView!.image = image
                }
                else
                {
                    
                }
            })
        }
    }
    
}
