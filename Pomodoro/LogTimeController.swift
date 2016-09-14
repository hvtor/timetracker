//
//  LogTimeController.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-14.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import UIKit

class LogTimeController: UIViewController,UITextViewDelegate {
    
    
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
            iv.alpha = 0.98
            iv.layer.cornerRadius = 20
            iv.backgroundColor = UIColor(hexString: "#123", alpha: 1.0)
            iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let inputsBackgroundView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 10
        v.layer.masksToBounds = true
        v.layer.opacity = 0.9
        v.backgroundColor = UIColor(hexString: "#123", alpha: 1.0)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let timerValue: UITextField = {
        let tv = UITextField()
        tv.textColor = UIColor.lightGray
        tv.backgroundColor = UIColor(hexString: "#051923", alpha: 1.0)
        tv.placeholder = ""
        tv.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
//    let projectLabel: UILabel = {
//        let pl = UILabel()
//        pl.textColor = UIColor.lightGray
//        pl.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
//        return pl
//    }()
    
    let projectName: UITextField = {
        let pn = UITextField()
        pn.text = "Enter Project Name"
        pn.textColor = UIColor.lightGray
        pn.backgroundColor = UIColor(hexString: "#051923", alpha: 1.0)
        pn.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        pn.translatesAutoresizingMaskIntoConstraints = false
        pn.clearsOnBeginEditing = true
        return pn
    }()
    
    
    func setupInputsContainerView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant:240).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        inputsContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, constant:-220).isActive = true
    }
    
    func setupDownArrow() {
        downArrow.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant:10).isActive = true
        downArrow.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        downArrow.heightAnchor.constraint(equalTo: downArrow.heightAnchor, constant:80).isActive = true
        downArrow.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    }
    
    func setupInputsBackgroundView() {
        inputsBackgroundView.topAnchor.constraint(equalTo: downArrow.bottomAnchor, constant: 40).isActive = true
        inputsBackgroundView.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        inputsBackgroundView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        inputsBackgroundView.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor).isActive = true
        
    
    }

    
    func setupTextFieldsContainer() {
        projectName.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        projectName.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 100).isActive = true
        projectName.bottomAnchor.constraint(equalTo: inputsContainerView.bottomAnchor).isActive = true
        projectName.heightAnchor.constraint(equalToConstant:50).isActive = true
        
        projectName.widthAnchor.constraint(equalTo: inputsBackgroundView.widthAnchor).isActive = true
        
        
        
        timerValue.centerXAnchor.constraint(equalTo: inputsBackgroundView.centerXAnchor).isActive = true
        timerValue.topAnchor.constraint(equalTo: projectName.bottomAnchor, constant: 0).isActive = true
        timerValue.widthAnchor.constraint(equalTo: inputsBackgroundView.widthAnchor).isActive = true
        timerValue.heightAnchor.constraint(equalToConstant:50).isActive = true
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(inputsContainerView)
        inputsContainerView.addSubview(inputsBackgroundView)
        inputsContainerView.addSubview(downArrow)
        inputsBackgroundView.addSubview(projectName)
        inputsBackgroundView.addSubview(timerValue)
        setupDownArrow()
        setupInputsContainerView()
        
        setupInputsBackgroundView()
        
        
        
        setupTextFieldsContainer()
        
        // Do any additional setup after loading the view.
        downArrow.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        inputsContainerView.isScrollEnabled = true
        var width = inputsContainerView.frame.size.width
        var height = CGFloat(3200.0)
        inputsContainerView.contentSize = CGSize(width:width, height:height)
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
