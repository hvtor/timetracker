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
        lcv.backgroundColor = UIColor.clear
        lcv.translatesAutoresizingMaskIntoConstraints = false
        
        return lcv
    }()
    
    let buttonsContainerView: UIView = {
        let bcv = UIView()
        bcv.backgroundColor = UIColor.white
        
        bcv.translatesAutoresizingMaskIntoConstraints = false
        
        return bcv
    }()
    
    let playButtonContainerView: UIView = {
        let pbc = UIView()
        pbc.backgroundColor = UIColor.orange
        
        pbc.translatesAutoresizingMaskIntoConstraints = false
        return pbc
 
    }()
    
    let timerLabel : UILabel = {
        let tl = UILabel()
            let font = UIFont(name: "Avenir-Heavy", size: 104.0)
            tl.textColor = UIColor(hexString: "#FAFAFA", alpha: 1.0)
            tl.font = font
            tl.textAlignment = NSTextAlignment.center
            tl.translatesAutoresizingMaskIntoConstraints = false
        return tl
    }()
    
    let taskLabel : UILabel = {
        let tl = UILabel()
            let font = UIFont(name: "HelveticaNeue", size: 28.0)
            tl.textColor = UIColor(hexString: "#FAFAFA", alpha: 1.0)
            tl.font = font
            tl.textAlignment = NSTextAlignment.center
            tl.lineBreakMode = NSLineBreakMode.byTruncatingTail
            tl.numberOfLines = 4
            tl.translatesAutoresizingMaskIntoConstraints = false
        return tl
        
    }()
    
    let showTasksListButton: ActionButton = {
        let tasksBtn = ActionButton()
        
        return tasksBtn
    }()
    
    let logTimeButton: ActionButton = {
        let logBtn = ActionButton()
        
        return logBtn
    }()
    
    
    
    let playPauseButton: PlayPauseButton = {
        let playBtn = PlayPauseButton()
        
        return playBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = UIColor(hexString: "#003554", alpha: 1.0)
        // Add Views to subview
        view.addSubview(labelsContainerView)
        view.addSubview(buttonsContainerView)
        labelsContainerView.addSubview(timerLabel)
        labelsContainerView.addSubview(taskLabel)
        buttonsContainerView.addSubview(playButtonContainerView)
        
        // Setup of View Constraints
        setupLabelsContainerView()
        setupButtonsContainerView()
        setupPlayContainer()
        setupLabelsInsideLabelsContainerView()
        timerLabel.text = "33:09"
        taskLabel.text = "Create an interface for TimeTracker App. Create two containers first. Then two labels with 0.5 multipliers. Then create your buttons in the container below."
    }
    
    func setupLabelsContainerView() {
        let topAnchorHeight = UIApplication.shared.statusBarFrame.height + 40
        labelsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelsContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant:topAnchorHeight).isActive = true
        labelsContainerView.widthAnchor.constraint(equalTo:view.widthAnchor, constant:-20).isActive = true
        labelsContainerView.heightAnchor.constraint(equalTo:view.widthAnchor, multiplier: 0.75).isActive = true
    }
    
    func setupLabelsInsideLabelsContainerView() {
        
        // Timer label constraints
        timerLabel.centerXAnchor.constraint(equalTo: labelsContainerView.centerXAnchor).isActive = true
        timerLabel.topAnchor.constraint(equalTo: labelsContainerView.topAnchor, constant:-20).isActive = true
        timerLabel.widthAnchor.constraint(equalTo: labelsContainerView.widthAnchor, constant: -20).isActive = true
        timerLabel.heightAnchor.constraint(equalTo: labelsContainerView.widthAnchor, multiplier: 0.5).isActive = true
        
        // Task description label constraints
        taskLabel.centerXAnchor.constraint(equalTo: labelsContainerView.centerXAnchor).isActive = true
        taskLabel.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant:-60).isActive = true
        taskLabel.widthAnchor.constraint(equalTo: labelsContainerView.widthAnchor, constant: -20).isActive = true
        taskLabel.heightAnchor.constraint(equalTo: labelsContainerView.widthAnchor, multiplier: 0.5).isActive = true
        
    }
    
    func setupButtonsContainerView() {
        
        buttonsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsContainerView.topAnchor.constraint(equalTo: labelsContainerView.bottomAnchor, constant:20).isActive = true
        buttonsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant:-20).isActive = true
        buttonsContainerView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
    
    }
    
    func setupPlayContainer() {
        playButtonContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playButtonContainerView.topAnchor.constraint(equalTo: buttonsContainerView.topAnchor).isActive = true
        playButtonContainerView.widthAnchor.constraint(equalTo: buttonsContainerView.widthAnchor).isActive = true
        playButtonContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

