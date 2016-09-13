//
//  PlayPauseButton.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-13.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import UIKit

class : UIButton {

    override func awakeFromNib() {
        self.backgroundColor = UIColor(hexString: "#0582CA", alpha: 1.0)
        self.layer.borderWidth = 8.0
        self.layer.borderColor = UIColor(hexString: "#003554", alpha: 1.0).cgColor
        
    }

}
