//
//  Project+CoreDataProperties.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-19.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project");
    }

    @NSManaged public var dollarsBilled: Double
    @NSManaged public var endDate: NSDate?
    @NSManaged public var hoursBilled: Double
    @NSManaged public var projectName: String?
    @NSManaged public var startDate: NSDate?
    @NSManaged public var taskDescription: String?
    @NSManaged public var taskRate: Double
    @NSManaged public var clientName: String?
    @NSManaged public var workerName: String?

}
