//
//  String+Extensions.swift
//  Photog
//
//  Created by Eric Sproles on 12/9/15.
//  Copyright © 2015 Sprolex. All rights reserved.
//

import Foundation

extension String
{
    func isEmailAddress() -> Bool
    {
        let predicate = self.predicateForEmail()
        return predicate.evaluateWithObject(self)
    }
    
    func predicateForEmail() -> NSPredicate
    {
      let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return NSPredicate(format: "SELF MATCHES %@", regularExpression)
    }
}