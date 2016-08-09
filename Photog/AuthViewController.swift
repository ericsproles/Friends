//
//  AuthViewController.swift
//  Photog
//
//  Created by Eric Sproles on 12/1/15.
//  Copyright © 2015 Sprolex. All rights reserved.
//

import UIKit
import Parse
import Bolts

enum Authmode
{
    case SignIn
    case SignUp
}


class AuthViewController: UIViewController, UITextFieldDelegate {

    var authMode: Authmode = Authmode.SignUp
    @IBOutlet var emailTextField: UITextField?
    @IBOutlet var passwordTextField: UITextField?
    
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        let emailImageView = UIImageView(frame: CGRectMake(0, 0, 50, self.emailTextField!.frame.size.height))
        emailImageView.image = UIImage(named: "EmailIcon")
        emailImageView.contentMode = .Center
        
        self.emailTextField!.leftView = emailImageView
        self.emailTextField!.leftViewMode = .Always
        
        let passwordImageView = UIImageView(frame: CGRectMake(0, 0, 50, self.passwordTextField!.frame.size.height))
        passwordImageView.image = UIImage(named: "PasswordIcon")
        passwordImageView.contentMode = .Center
        
        self.passwordTextField!.leftView = passwordImageView
        self.passwordTextField!.leftViewMode = .Always
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        self.emailTextField?.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if (textField == self.emailTextField)
        {
            self.emailTextField?.resignFirstResponder()
            self.passwordTextField?.becomeFirstResponder()
        }
        else if (textField == self.passwordTextField)
        {
            self.passwordTextField?.resignFirstResponder()
            self.authenticate()
        }
        return true
    }
    
    
    func authenticate()
    {
        let email = self.emailTextField?.text
        let password = self.passwordTextField?.text
        
        if(email?.isEmpty == true || password?.isEmpty == true || email?.isEmailAddress() == false) // is this an email address
        {
            self.showAlert("User error!", message: "Please check your email address and password")
    
            return
        }
        
        if authMode == .SignIn
        {
            self.signIn(email!, password: password!)
            
        }
        else
        {
            self.signUp(email!, password: password!)
        }
    }
    
    
    func signIn(email: String, password: String)
    {
        PFUser.logInWithUsernameInBackground(email, password: password) {
            (user: PFUser?, error: NSError?) -> Void in
            if(user != nil)
            {
                let tabBarController = TabBarController()
                self.navigationController?.pushViewController(tabBarController, animated: true)
            }
            else
            {
                print("sign in failure :( now alert the user")
            }
        }
    }
    
    
    func signUp(email: String, password: String)
    {
        let user = PFUser()
        user.username = email
        user.email = email
        user.password = password
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool?, error: NSError?) -> Void in
            
            if error == nil 
            {
                // New user follows him/herself
                NetworkManager.sharedInstance.follow(user, completionHandler: {
                    (error) -> () in
                    
                    if error == nil
                    {
                        let tabBarController = TabBarController()
                        self.navigationController?.pushViewController(tabBarController, animated: true)
                    }
                    else
                    {
                        print("Unable for user to follow themself")
                    }
                })
                
            }
            else
            {
                print("sign up failure! (alert the user)")
            }
        }
    }

}




















