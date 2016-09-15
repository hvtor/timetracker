//
//  LogTimeController.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-14.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import UIKit
import CoreData

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
    
    let taskDescription: UITextField = {
        let td = UITextField()
        td.textColor = UIColor.lightGray
        td.attributedPlaceholder = NSAttributedString(string: "Task Description", attributes: [NSForegroundColorAttributeName: UIColor(hexString:"#808080", alpha:1.0)])
        td.backgroundColor = UIColor(hexString: "#051923", alpha: 1.0)
        
        td.autocorrectionType = .no
        td.autocapitalizationType = .none
        td.spellCheckingType = .no
        
        td.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        td.translatesAutoresizingMaskIntoConstraints = false
        return td
    }()
    
    
    
    let taskRate: UITextField = {
        let tr = UITextField()
        tr.textColor = UIColor.lightGray
        tr.attributedPlaceholder = NSAttributedString(string: "$/hour", attributes: [NSForegroundColorAttributeName: UIColor(hexString:"#808080", alpha:1.0)])
        tr.backgroundColor = UIColor(hexString: "#051923", alpha: 1.0)
        
        tr.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        
        tr.autocorrectionType = .no
        tr.autocapitalizationType = .none
        tr.spellCheckingType = .no
        
        tr.translatesAutoresizingMaskIntoConstraints = false
        return tr
    }()
    
    let projectName: UITextField = {
        let pn = UITextField()
        pn.attributedPlaceholder = NSAttributedString(string: "Enter Project Name", attributes: [NSForegroundColorAttributeName: UIColor(hexString:"#808080", alpha:1.0)])
        pn.textColor = UIColor.init(hexString: "#FAFAFA", alpha: 1.0)
        pn.font = UIFont(name: "Helvetica", size: 24.0)
        pn.backgroundColor = UIColor(hexString: "#051923", alpha: 1.0)
        pn.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        pn.translatesAutoresizingMaskIntoConstraints = false
        
        pn.autocorrectionType = .no
        pn.autocapitalizationType = .none
        pn.spellCheckingType = .no
        return pn
    }()
    
    
    func setupInputsContainerView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant:240).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        inputsContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, constant:-260).isActive = true
    }
    
    func setupDownArrow() {
        downArrow.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant:10).isActive = true
        downArrow.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        downArrow.heightAnchor.constraint(equalTo: downArrow.heightAnchor, constant:80).isActive = true
        downArrow.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    }
    
    func setupInputsBackgroundView() {
        inputsBackgroundView.topAnchor.constraint(equalTo: downArrow.bottomAnchor, constant: 0).isActive = true
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
        
        taskDescription.centerXAnchor.constraint(equalTo: inputsBackgroundView.centerXAnchor).isActive = true
        taskDescription.topAnchor.constraint(equalTo: projectName.bottomAnchor, constant: 0).isActive = true
        taskDescription.widthAnchor.constraint(equalTo: inputsBackgroundView.widthAnchor).isActive = true
        taskDescription.heightAnchor.constraint(equalToConstant:50).isActive = true
        
        taskRate.centerXAnchor.constraint(equalTo: inputsBackgroundView.centerXAnchor).isActive = true
        taskRate.topAnchor.constraint(equalTo: taskDescription.bottomAnchor, constant: 0).isActive = true
        taskRate.widthAnchor.constraint(equalTo: inputsBackgroundView.widthAnchor).isActive = true
        taskRate.heightAnchor.constraint(equalToConstant:50).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(inputsContainerView)
        inputsContainerView.addSubview(inputsBackgroundView)
        inputsContainerView.addSubview(downArrow)
        inputsBackgroundView.addSubview(projectName)
        inputsBackgroundView.addSubview(taskDescription)
        inputsBackgroundView.addSubview(taskRate)
        
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
        var height = CGFloat(600.0)
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
