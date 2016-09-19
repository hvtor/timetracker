//
//  LogTimeController.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-14.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import UIKit
import CoreData

class LogTimeViewController: UIViewController {

    var container: NSPersistentContainer!
    var projectObject: NSManagedObject!
    var moc: NSManagedObjectContext!
    
    var hoursBilledDefaults = UserDefaults.standard
    
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
        tr.keyboardType = .decimalPad

        tr.autocorrectionType = .no
        tr.autocapitalizationType = .none
        tr.spellCheckingType = .no
        
        tr.translatesAutoresizingMaskIntoConstraints = false
        return tr
    }()
    
   
    
    let clientName: UITextField = {
        let client = UITextField()
        
        client.attributedPlaceholder = NSAttributedString(string: "Client Name", attributes: [NSForegroundColorAttributeName: UIColor(hexString:"#808080", alpha:1.0)])
        client.textColor = UIColor.init(hexString: "#FAFAFA", alpha: 1.0)
        
        client.backgroundColor = UIColor(hexString: "#051923", alpha: 1.0)
        client.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        
        client.autocorrectionType = .no
        client.autocapitalizationType = .none
        client.spellCheckingType = .no
        client.translatesAutoresizingMaskIntoConstraints = false
        return client
    }()
    
    let workerName: UITextField = {
        let worker = UITextField()
        worker.textColor = UIColor(hexString: "#FAFAFA", alpha: 1.0)
        worker.attributedPlaceholder = NSAttributedString(string: "Worker Name", attributes: [NSForegroundColorAttributeName: UIColor(hexString:"#808080", alpha:1.0)])
        worker.backgroundColor = UIColor(hexString: "#051923", alpha: 1.0)
        worker.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        worker.translatesAutoresizingMaskIntoConstraints = false
        
        return worker
        }()
    
    let saveButton: UIButton = {
    
        let save = UIButton()
        save.layer.cornerRadius = 5.0
        save.alpha = 1.0
        save.setTitle("Save Project", for: .normal)
        save.backgroundColor = UIColor(hexString: "#006494", alpha: 1.0)
        
        save.translatesAutoresizingMaskIntoConstraints = false
        
        return save
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
        inputsBackgroundView.topAnchor.constraint(equalTo: downArrow.bottomAnchor, constant: -40).isActive = true
        inputsBackgroundView.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        inputsBackgroundView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        inputsBackgroundView.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor).isActive = true
    }
 
    
    
    func setupTextFieldsContainer() {
        projectName.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        projectName.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 60).isActive = true
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
        
        clientName.centerXAnchor.constraint(equalTo: inputsBackgroundView.centerXAnchor).isActive = true
        clientName.topAnchor.constraint(equalTo: taskRate.bottomAnchor, constant: 0).isActive = true
        clientName.widthAnchor.constraint(equalTo: inputsBackgroundView.widthAnchor).isActive = true
        clientName.heightAnchor.constraint(equalToConstant:50).isActive = true
        
        workerName.centerXAnchor.constraint(equalTo: inputsBackgroundView.centerXAnchor).isActive = true
        workerName.topAnchor.constraint(equalTo: clientName.bottomAnchor).isActive = true
        workerName.widthAnchor.constraint(equalTo: inputsBackgroundView.widthAnchor).isActive = true
        workerName.heightAnchor.constraint(equalToConstant:50).isActive = true
        
        saveButton.centerXAnchor.constraint(equalTo: inputsBackgroundView.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: workerName.bottomAnchor, constant: 20).isActive = true
        saveButton.widthAnchor.constraint(equalTo: inputsBackgroundView.widthAnchor, constant: -20).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant:50).isActive = true
        

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        var hoursBilled = hoursBilledDefaults.object(forKey: "hoursBilled") as! Double
        let container = NSPersistentContainer(name: "Pomodoro")
        
        container.loadPersistentStores(completionHandler: { storeDescription, error in
                if let error = error {
                    print("Unresolved error \(error)")
                }
            })
        view.addSubview(inputsContainerView)
        inputsContainerView.addSubview(inputsBackgroundView)
        inputsContainerView.addSubview(downArrow)
        inputsBackgroundView.addSubview(projectName)
        inputsBackgroundView.addSubview(taskDescription)
        inputsBackgroundView.addSubview(taskRate)
        inputsBackgroundView.addSubview(clientName)
        inputsBackgroundView.addSubview(workerName)
        inputsBackgroundView.addSubview(saveButton)
        
        setupDownArrow()
        setupInputsContainerView()
        
        setupInputsBackgroundView()
        setupTextFieldsContainer()
        
        // Do any additional setup after loading the view.
        downArrow.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        inputsContainerView.isScrollEnabled = true
        let width = inputsContainerView.frame.size.width
        let height = CGFloat(650.0)
        inputsContainerView.contentSize = CGSize(width:width, height:height)
    }
    
    func dismissViewController() {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    func saveButtonPressed() {

        let dateNow = NSDate()
        print(dateNow)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let container = appDelegate.persistentContainer
        
        let moc = container.viewContext
        
        let projectEntity = NSEntityDescription.entity(forEntityName: "Project", in: moc)
        
//        let projectObject = NSManagedObject(entity: projectEntity!, insertInto: moc)
        
        let projectObject = NSEntityDescription.insertNewObject(forEntityName: "Project", into: moc)
        
        // let fetchRequest = NSFetchRequest(entityName: "Project")
//        let clientEntity = NSEntityDescription.entity(forEntityName: "Client", in: moc)
        
//        let clientObject = NSManagedObject(entity: clientEntity!, insertInto: moc)
        
        // Hours Billed Obtained from userDefaults in ViewController
        let hoursBilled = hoursBilledDefaults.object(forKey: "hoursBilled") as! Double
        
        // Task Rate String Converted to Decimal Value
        let taskRate = decimalWithString(string: self.taskRate.text!) as Double
        
        // Calculation for Dollars Billed
        let dollarsBilled = hoursBilled * taskRate
        
        projectObject.setValue(projectName.text!, forKey: "projectName")
        projectObject.setValue(taskRate, forKey: "taskRate")
        projectObject.setValue(taskDescription.text!, forKey: "taskDescription")
        projectObject.setValue(clientName.text!, forKey: "clientName")
        projectObject.setValue(workerName.text!, forKey: "workerName")
        projectObject.setValue(dateNow, forKey: "startDate")
        projectObject.setValue(Date(), forKey: "endDate")
        projectObject.setValue(hoursBilled, forKey: "hoursBilled")
        projectObject.setValue(dollarsBilled, forKey: "dollarsBilled")

        print(projectObject)
        do {
            try moc.save()
        }catch {
            print("Error in storing to Core Data: \(error)")
            fatalError("Error in storing to Core Data")
        }    }

    func saveContext() {
//        if container.viewContext.hasChanges {
            do {
                try moc.save()
            }catch {
                print("Error in storing to Core Data: \(error)")
                fatalError("Error in storing to Core Data")
            }
//        }
    }
    
    func decimalWithString(string: String) -> NSDecimalNumber {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        return formatter.number(from: string) as? NSDecimalNumber ?? 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
