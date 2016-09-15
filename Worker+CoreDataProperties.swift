//
//  Worker+CoreDataProperties.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-15.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import Foundation
import CoreData

extension Worker {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Worker> {
        return NSFetchRequest<Worker>(entityName: "Worker");
    }

    @NSManaged public var id: String?
    @NSManaged public var project: Project?

}