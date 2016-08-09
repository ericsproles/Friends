//
//  NSDate+Extensions.swift
//  Photog
//
//  Created by Eric Sproles on 8/3/16.
//  Copyright © 2016 Sprolex. All rights reserved.
//

import Foundation
import UIKit

extension NSDate
{
    func fuzzyTime() -> String
    {
        let secondsInOneDay = CGFloat(60 * 60 * 24)
        let secondsInOneHour = CGFloat(60 * 60)
        
        let seconds = CGFloat(NSDate().timeIntervalSinceDate(self))
        let days = seconds / secondsInOneDay
        let hours = (seconds % secondsInOneDay) / secondsInOneHour
        let minutes = (seconds % secondsInOneHour) / 60
        
        var string = "-"
        
        if (days > 1)
        {
            string = "\(Int(days))d"
        }
        else if (hours > 1)
        {
            string = "\(Int(hours))h"
        }
        else if (minutes > 1)
        {
            string = "\(Int(minutes))m"
        }
        else if (seconds > 1)
        {
            string = "\(Int(seconds))s"
        }
        
        return string
    }
}