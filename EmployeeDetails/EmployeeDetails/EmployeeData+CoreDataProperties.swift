//
//  EmployeeData+CoreDataProperties.swift
//  EmployeeDetails
//
//  Created by Felix-ITS015 on 22/09/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//
//

import Foundation
import CoreData


extension EmployeeData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeData> {
        return NSFetchRequest<EmployeeData>(entityName: "EmployeeData")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var email: String?
    @NSManaged public var technology: String?
    @NSManaged public var phone: Int64

}
