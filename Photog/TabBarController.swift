//
//  TabBarController.swift
//  Photog
//
//  Created by Eric Sproles on 1/18/16.
//  Copyright © 2016 Sprolex. All rights reserved.
//

import UIKit
import Parse

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // View Controllers, currently only FeedViewController is set up
        
        let feedViewController = FeedViewController(nibName: "FeedViewController", bundle: nil)

        let profileViewController = UIViewController()
        profileViewController.view.backgroundColor = UIColor.yellowColor()
        
        let searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        
        let cameraViewController = UIViewController()
        cameraViewController.view.backgroundColor = UIColor.purpleColor()
        
        let viewControllers = [feedViewController, profileViewController, searchViewController, cameraViewController]
        self.setViewControllers(viewControllers, animated: true)
        
        var imageNames = ["FeedIcon", "ProfileIcon", "SearchIcon", "CameraIcon"]
        
        let tabItems = tabBar.items! as [UITabBarItem]
        for (index, value) in tabItems.enumerate()
        {
            let imageName = imageNames[index]
            value.image = UIImage(named: imageName)
            value.imageInsets = UIEdgeInsetsMake(5.0, 0, -5.0, 0)
        }
        
        self.edgesForExtendedLayout = UIRectEdge.None
        self.navigationItem.hidesBackButton = true
        self.tabBar.translucent = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .Done, target: self, action: #selector(TabBarController.didTapSignOut))
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Photog"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTapSignOut(sender: AnyObject)
    {
        PFUser.logOut()
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
}
