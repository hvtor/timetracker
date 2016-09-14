//
//  ViewController.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-13.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    let labelsContainerView: UIView = {
        let lcv = UIView()
        lcv.backgroundColor = UIColor.clear
        lcv.translatesAutoresizingMaskIntoConstraints = false
        
        return lcv
    }()
    
    let buttonsContainerView: UIView = {
        let bcv = UIView()
        bcv.backgroundColor = UIColor.clear
        
        bcv.translatesAutoresizingMaskIntoConstraints = false
        
        return bcv
    }()
    
    let playButtonContainerView: UIView = {
        let pbc = UIView()
        pbc.backgroundColor = UIColor.clear
        
        pbc.translatesAutoresizingMaskIntoConstraints = false
        return pbc
 
    }()
    
    let actionButtonsContainerView: UIView = {
        let abc = UIView()
        abc.backgroundColor = UIColor.cyan
        
        abc.translatesAutoresizingMaskIntoConstraints = false
        return abc
    }()
    
    let tasksButtonContainerView: UIView = {
        let tbc = UIView()
        tbc.backgroundColor = UIColor.clear
        
        tbc.translatesAutoresizingMaskIntoConstraints = false
        return tbc
    }()
    
    let tasksListContainerView: UIView = {
        let tlc = UIView()
        tlc.backgroundColor = UIColor.cyan
        
        tlc.translatesAutoresizingMaskIntoConstraints = false
        return tlc
    }()
    
    let logButtonContainerView: UIView = {
        let lbc = UIView()
        lbc.backgroundColor = UIColor.brown
        
        lbc.translatesAutoresizingMaskIntoConstraints = false
        
        return lbc
    }()
    
    let timerLabel : UILabel = {
        let tl = UILabel()
            let font = UIFont(name: "Avenir-Book", size: 84.0)
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
            tl.numberOfLines = 2
            tl.translatesAutoresizingMaskIntoConstraints = false
        return tl
        
    }()
    
    let tasksListButton: ActionButton = {
        let tasksBtn = ActionButton()
        
        return tasksBtn
    }()
    
    let logTimeButton: ActionButton = {
        let logBtn = ActionButton()
        logBtn.translatesAutoresizingMaskIntoConstraints = false

        return logBtn
    }()
    
    let playPauseButton: PlayPauseButton = {
        let playBtn = PlayPauseButton()
        
        playBtn.layer.backgroundColor = UIColor(hexString: "#0082c7", alpha: 1.0).cgColor
        playBtn.layer.borderWidth = 12.0
        playBtn.layer.borderColor = UIColor(hexString: "#041922", alpha: 1.0).cgColor
        
        playBtn.translatesAutoresizingMaskIntoConstraints = false
        playBtn.clipsToBounds = true

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
        playButtonContainerView.addSubview(playPauseButton)
        buttonsContainerView.addSubview(actionButtonsContainerView)
        
        // Setup of View Constraints
        setupLabelsContainerView()
        setupLabelsInsideLabelsContainerView()
        
        setupButtonsContainerView()
            setupPlayContainer()
            setupPlayPauseButton()
        
        
            setupActionButtonsContainer()
        
        
        timerLabel.text = "00:00"
        taskLabel.text = "Create an interface for TimeTracker App. Create two containers first. Then two labels with 0.5 multipliers. Then create your buttons in the container below."
    }
    
    func setupLabelsContainerView() {
        let topAnchorHeight = UIApplication.shared.statusBarFrame.height + 20
        labelsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelsContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant:topAnchorHeight).isActive = true
        labelsContainerView.widthAnchor.constraint(equalTo:view.widthAnchor, constant:-20).isActive = true
        labelsContainerView.heightAnchor.constraint(equalTo:view.widthAnchor, multiplier: 0.60).isActive = true
    }
    
    func setupLabelsInsideLabelsContainerView() {
        
        // Timer label constraints
        timerLabel.centerXAnchor.constraint(equalTo: labelsContainerView.centerXAnchor).isActive = true
        timerLabel.topAnchor.constraint(equalTo: labelsContainerView.topAnchor, constant:-20).isActive = true
        timerLabel.widthAnchor.constraint(equalTo: labelsContainerView.widthAnchor, constant: -20).isActive = true
        timerLabel.heightAnchor.constraint(equalTo: labelsContainerView.widthAnchor, multiplier: 0.45).isActive = true
        
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
        buttonsContainerView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
    }
    
    func setupPlayContainer() {
        playButtonContainerView.centerXAnchor.constraint(equalTo: buttonsContainerView.centerXAnchor).isActive = true
        playButtonContainerView.topAnchor.constraint(equalTo: buttonsContainerView.topAnchor).isActive = true
        playButtonContainerView.widthAnchor.constraint(equalTo: buttonsContainerView.widthAnchor).isActive = true
        playButtonContainerView.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 0.60).isActive = true
        
    }
    
    func setupPlayPauseButton() {
        playPauseButton.centerXAnchor.constraint(equalTo: playButtonContainerView.centerXAnchor).isActive = true
        playPauseButton.centerYAnchor.constraint(equalTo: playButtonContainerView.centerYAnchor).isActive = true
        
        playPauseButton.widthAnchor.constraint(equalTo: playButtonContainerView.heightAnchor, multiplier: 0.8).isActive = true
        playPauseButton.heightAnchor.constraint(equalTo: playButtonContainerView.heightAnchor, multiplier: 0.8).isActive = true
    }
    
    func setupActionButtonsContainer() {        
        actionButtonsContainerView.centerXAnchor.constraint(equalTo: buttonsContainerView.centerXAnchor).isActive = true
        actionButtonsContainerView.topAnchor.constraint(equalTo: playButtonContainerView.bottomAnchor).isActive = true
        actionButtonsContainerView.widthAnchor.constraint(equalTo: buttonsContainerView.widthAnchor).isActive = true
        actionButtonsContainerView.heightAnchor.constraint(equalTo: buttonsContainerView.widthAnchor, multiplier: 0.35).isActive = true
    }
    
    func setupTasksListContainer() {
        tasksButtonContainerView.leftAnchor.constraint(equalTo: actionButtonsContainerView.leftAnchor).isActive = true
        tasksButtonContainerView.topAnchor.constraint(equalTo: actionButtonsContainerView.topAnchor).isActive = true
        tasksButtonContainerView.widthAnchor.constraint(equalTo: actionButtonsContainerView.widthAnchor, multiplier: 0.5).isActive = true
        tasksButtonContainerView.heightAnchor.constraint(equalTo: actionButtonsContainerView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    func logTimeContainer() {
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

