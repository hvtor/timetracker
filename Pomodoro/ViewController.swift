//
//  ViewController.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-13.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let labelsContainerView: UIView = {
        let lcv = UIView()
        lcv.backgroundColor = UIColor.white
        lcv.translatesAutoresizingMaskIntoConstraints = false
        
        return lcv
    }()
    
    let buttonsContainerView: UIView = {
        let bcv = UIView()
        bcv.backgroundColor = UIColor.blue
        bcv.translatesAutoresizingMaskIntoConstraints = false
        
        return bcv
    }()
    
    
    
    let timerLabel : UILabel = {
        let tl = UILabel()
        let font = UIFont(name: "HelveticaNeue-Thin", size: 64.0)
        tl.font = font
        return tl
    }()
    
    let taskLabel : UILabel = {
        let tl = UILabel()
        
        return tl
        
    }()
    
    let logTimeButton: ActionButton = {
        let ltb = ActionButton()
        
        return ltb
    }()
    
    
    
    let playPauseButton: PlayPauseButton = {
        let ppb = PlayPauseButton()
        
        return ppb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = UIColor(hexString: "#003554", alpha: 1.0)
        
        view.addSubview(labelsContainerView)
        view.addSubview(buttonsContainerView)
        setupLabelsContainerView()
    }
    
    func setupLabelsContainerView() {
        let topAnchorHeight = UIApplication.shared.statusBarFrame.height + 20
        labelsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelsContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant:topAnchorHeight).isActive = true
        labelsContainerView.widthAnchor.constraint(equalTo:view.widthAnchor, constant:-20).isActive = true
        labelsContainerView.heightAnchor.constraint(equalTo:view.widthAnchor, multiplier: 0.75).isActive = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

