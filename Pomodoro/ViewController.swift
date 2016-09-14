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
    
    let playPauseButton: PlayPauseButton = {
        let playBtn = PlayPauseButton()
        
        playBtn.layer.backgroundColor = UIColor(hexString: "#0082c7", alpha: 1.0).cgColor
        playBtn.layer.borderWidth = 12.0
        playBtn.layer.borderColor = UIColor(hexString: "#041922", alpha: 1.0).cgColor
        
        playBtn.translatesAutoresizingMaskIntoConstraints = false
        playBtn.clipsToBounds = true
        
        playBtn.setImage(UIImage(named:"play.png"), for: .normal)

        
        return playBtn
    }()
    
    let actionButtonsContainerView: UIView = {
        let abc = UIView()
        abc.backgroundColor = UIColor.clear
        
        abc.translatesAutoresizingMaskIntoConstraints = false
        return abc
    }()
    
    let tasksButtonContainerView: UIView = {
        let tbc = UIView()
        tbc.backgroundColor = UIColor.clear
        
        tbc.translatesAutoresizingMaskIntoConstraints = false
        return tbc
    }()
    
    let logButtonContainerView: UIView = {
        let lbc = UIView()
        lbc.backgroundColor = UIColor.clear
        
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
            let font = UIFont(name: "HelveticaNeue", size: 20.0)
            tl.textColor = UIColor(hexString: "#FAFAFA", alpha: 1.0)
            tl.font = font
            tl.textAlignment = NSTextAlignment.center
            tl.lineBreakMode = NSLineBreakMode.byTruncatingTail
            tl.numberOfLines = 2
            tl.translatesAutoresizingMaskIntoConstraints = false
        return tl
        
    }()
    
    let tasksButton: ActionButton = {
        let tasksBtn = ActionButton()
        tasksBtn.backgroundColor = UIColor.white
        tasksBtn.layer.borderColor = UIColor.white.cgColor
        tasksBtn.layer.borderWidth = 0
        tasksBtn.setImage(UIImage(named:"tasks.png"), for: .normal)
        tasksBtn.translatesAutoresizingMaskIntoConstraints = false
        return tasksBtn
    }()
    
    let logButton: ActionButton = {
        let logBtn = ActionButton()
        logBtn.backgroundColor = UIColor.white
        logBtn.layer.borderColor = UIColor.white.cgColor
        logBtn.layer.borderWidth = 0
        logBtn.setImage(UIImage(named:"log.png"), for: .normal)
        logBtn.translatesAutoresizingMaskIntoConstraints = false
        return logBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = UIColor(hexString: "#003554", alpha: 1.0)
        // Adding Views to subviews
        view.addSubview(labelsContainerView)
        view.addSubview(buttonsContainerView)
        labelsContainerView.addSubview(timerLabel)
        labelsContainerView.addSubview(taskLabel)
        buttonsContainerView.addSubview(playButtonContainerView)
        playButtonContainerView.addSubview(playPauseButton)
        buttonsContainerView.addSubview(actionButtonsContainerView)
        
        actionButtonsContainerView.addSubview(tasksButtonContainerView)
        actionButtonsContainerView.addSubview(logButtonContainerView)
        
        tasksButtonContainerView.addSubview(tasksButton)
        logButtonContainerView.addSubview(logButton)
        
        // Setup of LabelsContainer
        setupLabelsContainerView()
            setupLabelsInsideLabelsContainerView()
        // Setup of ButtonsContainer
        setupButtonsContainerView()
            setupPlayContainer()
            setupPlayPauseButton()
        // Setup of Buttons within Container
        setupActionButtonsContainer()
            setupTasksButtonContainer()
                setupTasksButton()
            setupLogTimeContainer()
                setupLogTimeButton()
        
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
        actionButtonsContainerView.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 0.40).isActive = true
    }
    
    func setupTasksButtonContainer() {
        tasksButtonContainerView.leftAnchor.constraint(equalTo: actionButtonsContainerView.leftAnchor).isActive = true
        tasksButtonContainerView.topAnchor.constraint(equalTo: actionButtonsContainerView.topAnchor).isActive = true
        tasksButtonContainerView.widthAnchor.constraint(equalTo: actionButtonsContainerView.widthAnchor, multiplier: 0.5).isActive = true
        tasksButtonContainerView.heightAnchor.constraint(equalTo: actionButtonsContainerView.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setupTasksButton() {
    
        tasksButton.centerXAnchor.constraint(equalTo: tasksButtonContainerView.centerXAnchor).isActive = true
        tasksButton.centerYAnchor.constraint(equalTo: tasksButtonContainerView.centerYAnchor).isActive = true
        tasksButton.widthAnchor.constraint(equalTo: tasksButtonContainerView.heightAnchor, multiplier: 0.5).isActive = true
        tasksButton.heightAnchor.constraint(equalTo: tasksButtonContainerView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    func setupLogTimeContainer() {
        logButtonContainerView.rightAnchor.constraint(equalTo: actionButtonsContainerView.rightAnchor).isActive = true
        logButtonContainerView.topAnchor.constraint(equalTo: actionButtonsContainerView.topAnchor).isActive = true
        logButtonContainerView.widthAnchor.constraint(equalTo: actionButtonsContainerView.widthAnchor, multiplier: 0.5).isActive = true
        logButtonContainerView.heightAnchor.constraint(equalTo: actionButtonsContainerView.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setupLogTimeButton() {
        logButton.centerXAnchor.constraint(equalTo: logButtonContainerView.centerXAnchor).isActive = true
        logButton.centerYAnchor.constraint(equalTo: logButtonContainerView.centerYAnchor).isActive = true
        logButton.widthAnchor.constraint(equalTo: logButtonContainerView.heightAnchor, multiplier: 0.5).isActive = true
        logButton.heightAnchor.constraint(equalTo: logButtonContainerView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

