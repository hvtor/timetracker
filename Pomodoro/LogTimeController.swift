//
//  LogTimeController.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-14.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import UIKit

class LogTimeController: UIViewController {
    
    let logTimeView: UILabel = {
        let v = UILabel()
            v.layer.cornerRadius = 10
            v.backgroundColor = UIColor(hexString: "#0582ca", alpha: 1.0)
            v.alpha = 0.5
            v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let downArrow: UIButton = {
        let da = UIButton()
        da.setImage(UIImage(named:"downArrow.png"), for: .normal)
        da.titleShadowColor(for: .normal)
        da.translatesAutoresizingMaskIntoConstraints = false
        return da
    }()
    
    let inputsContainerView: UIScrollView = {
        let iv = UIScrollView()
        
            iv.backgroundColor = UIColor(hexString: "#006494", alpha: 1.0)
            iv.alpha = 0.97
            iv.layer.cornerRadius = 5
            iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let timerValue: UITextField = {
        let tv = UITextField()
        
        tv.backgroundColor = UIColor(hexString: "#FAFAFA", alpha: 1.0)
        tv.placeholder = ""
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let projectName: UITextField = {
        let pn = UITextField()
        pn.translatesAutoresizingMaskIntoConstraints = false
        return pn
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
        logTimeView.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor).isActive = true
    }
    
    func setupTextFields() {
    
    
    }
    
    func setupDownArrow() {
        downArrow.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant:10).isActive = true
        downArrow.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        downArrow.heightAnchor.constraint(equalTo: downArrow.heightAnchor, constant:40).isActive = true
        downArrow.widthAnchor.constraint(equalTo: downArrow.widthAnchor, constant: 160).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(inputsContainerView)
        inputsContainerView.addSubview(logTimeView)
        inputsContainerView.addSubview(downArrow)
        let vev = UIVisualEffectView()
        logTimeView.addSubview(vev)
        
        setupInputsView()
        setupLogTimeView()
        setupDownArrow()
        
        // Do any additional setup after loading the view.
        downArrow.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
    }
    
    func dismissViewController() {
        
        self.dismiss(animated: true, completion: nil)
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
