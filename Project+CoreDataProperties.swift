//
//  Project+CoreDataProperties.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-15.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import Foundation
import CoreData

extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project");
    }

    @NSManaged public var projectName: String?
    @NSManaged public var startDate: NSDate?
    @NSManaged public var endDate: NSDate?
    @NSManaged public var taskRate: NSDecimalNumber?
    @NSManaged public var taskDescription: String?
    @NSManaged public var client: Client?
    @NSManaged public var worker: Worker?

}
