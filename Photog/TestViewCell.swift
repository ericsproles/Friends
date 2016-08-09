//
//  TestViewCell.swift
//  Photog
//
//  Created by Eric Sproles on 4/29/16.
//  Copyright © 2016 Sprolex. All rights reserved.
//

import UIKit
import Parse


class TestViewCell: UITableViewCell {
    
    var item: PFObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
