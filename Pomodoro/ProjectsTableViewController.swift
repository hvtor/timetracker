//
//  ProjectsTableViewController.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-16.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import UIKit
import CoreData

class ProjectsTableViewController: UITableViewController {

    var moc: NSManagedObjectContext!
    
    var projects: [NSManagedObject]!
    var projectCell: ProjectCell!
    
    var cellIdentifier: String = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView?.register(ProjectCell.self, forCellReuseIdentifier: cellIdentifier)
        
        navigationController?.navigationBar.backgroundColor = UIColor(hexString: "#006494", alpha: 1)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(ProjectsTableViewController.done))
        
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "#123", alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor(hexString: "#FAFAFA", alpha: 1.0)
        view.backgroundColor = UIColor(hexString: "#FAFAFA", alpha: 1.0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let container = appDelegate.persistentContainer
        self.moc = container.viewContext
        
        fetchProjects()
        print(projects)

    }
    
    func fetchProjects() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Project")
        
        do {
            let fetchResult = try self.moc.fetch(fetchRequest)
            self.projects = fetchResult as! [NSManagedObject]
            print(projects)
        } catch let error as NSError {
            print("Could not fetch projects \(error), \(error.userInfo)")
        }
        
    }
    
    func done() {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.projects.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let projectCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        

        let project = self.projects[indexPath.row]
        
        projectCell.textLabel?.text = project.value(forKey: "projectName") as! String?
        projectCell.textLabel?.textColor = UIColor(hexString: "#123", alpha: 1.0)

        return projectCell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
