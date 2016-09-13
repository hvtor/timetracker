//
//  ActionButton.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-13.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import UIKit

class ActionButton: UIButton {

    override func awakeFromNib() {
        self.layer.backgroundColor = UIColor.init(hexString: "#FEFEFE", alpha: 1.0).cgColor
        self.layer.cornerRadius = self.frame.width/2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.size.height / 2.0
        clipsToBounds = true
    }

}
