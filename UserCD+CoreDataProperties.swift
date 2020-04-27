//
//  UserCD+CoreDataProperties.swift
//  FriendFace
//
//  Created by slava bily on 25/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//
//

import Foundation
import CoreData


extension UserCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCD> {
        return NSFetchRequest<UserCD>(entityName: "UserCD")
    }

    @NSManaged public var company: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var friends: NSSet?
    
    public var wrappedName: String {
        name ?? "Unknown User Name"
    }
    
    public var wrappedCompany: String {
        company ?? "Unknown User Company"
    }
    
    public var wrappedID: String {
        id ?? "Unknown User ID"
    }
    
    public var friendsArray: [FriendCD] {
        let set = friends as? Set<FriendCD> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for friends
extension UserCD {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: FriendCD)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: FriendCD)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}
