//
//  Client+CoreDataProperties.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-15.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import Foundation
import CoreData

extension Client {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Client> {
        return NSFetchRequest<Client>(entityName: "Client");
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var companyName: String?
    @NSManaged public var project: NSSet?

}

// MARK: Generated accessors for project
extension Client {

    @objc(addProjectObject:)
    @NSManaged public func addToProject(_ value: Project)

    @objc(removeProjectObject:)
    @NSManaged public func removeFromProject(_ value: Project)

    @objc(addProject:)
    @NSManaged public func addToProject(_ values: NSSet)

    @objc(removeProject:)
    @NSManaged public func removeFromProject(_ values: NSSet)

}
