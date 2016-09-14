//
//  LogTimeController.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-14.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import UIKit

class LogTimeController: UIViewController {
    
    let logTimeView: UIVisualEffectView = {
        let v = UIVisualEffectView()
            v.layer.cornerRadius = 10
            
            v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let inputsContainerView: UIScrollView = {
        let iv = UIScrollView()
        
            iv.layer.backgroundColor = UIColor(hexString: "#006494", alpha: 1.0).cgColor
            iv.alpha = 0.95
            iv.layer.cornerRadius = 5
            iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    func setupInputsView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant:160).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        inputsContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -180).isActive = true
    }
    func setupLogTimeView() {
        logTimeView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logTimeView.topAnchor.constraint(equalTo: view.topAnchor, constant:160).isActive = true
        logTimeView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        logTimeView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -180).isActive = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(inputsContainerView)
        inputsContainerView.addSubview(logTimeView)
        let vev = UIVisualEffectView()
        logTimeView.addSubview(vev)
        
        setupInputsView()
        setupLogTimeView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
