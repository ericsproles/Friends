//
//  UIViewController+Extensions.swift
//  Photog
//
//  Created by Eric Sproles on 1/13/16.
//  Copyright © 2016 Sprolex. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    func showAlert(message: String)
    {
        self.showAlert("Uh Oh!", message: message)
    }
    
    func showAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Okay!", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}

    
