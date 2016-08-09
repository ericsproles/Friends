//
//  StartViewController.swift
//  Photog
//
//  Created by Eric Sproles on 11/24/15.
//  Copyright © 2015 Sprolex. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        
        
    }
    
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapSignIn(sender: AnyObject)
    {
        let viewController = AuthViewController(nibName: "AuthViewController", bundle: nil)
        viewController.authMode = .SignIn
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func didTapSignUp(sender: AnyObject)
    {
        let viewController = AuthViewController(nibName: "AuthViewController", bundle: nil)
        viewController.authMode = .SignUp
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
