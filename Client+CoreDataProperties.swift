//
//  Client+CoreDataProperties.swift
//  Pomodoro
//
//  Created by Hemant Torsekar on 2016-09-19.
//  Copyright © 2016 Hemant Torsekar. All rights reserved.
//

import Foundation
import CoreData


extension Client {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Client> {
        return NSFetchRequest<Client>(entityName: "Client");
    }

    @NSManaged public var companyName: String?
    @NSManaged public var email: String?
    @NSManaged public var name: String?

}
