//
//  FriendCD+CoreDataProperties.swift
//  FriendFace
//
//  Created by slava bily on 25/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//
//

import Foundation
import CoreData


extension FriendCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendCD> {
        return NSFetchRequest<FriendCD>(entityName: "FriendCD")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var user: UserCD?

}
