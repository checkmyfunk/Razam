//
//  Meeting+CoreDataProperties.swift
//  Razam
//
//  Created by Vitali Potchekin on 1/21/17.
//  Copyright © 2017 Vitali Potchekin. All rights reserved.
//

import Foundation
import CoreData


extension Meeting {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meeting> {
        return NSFetchRequest<Meeting>(entityName: "Meeting");
    }

    @NSManaged public var company: Bool
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var photo: NSData?
    @NSManaged public var text: String?

}
